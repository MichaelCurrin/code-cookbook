# SQLModel with FastAPI


SQLModel is a library created by the author of FastAPI that combines SQLAlchemy and Pydantic into a single framework. It lets you define classes that act simultaneously as database tables (SQLAlchemy models) and data validation/serialization schemas (Pydantic models), completely eliminating code duplication.

Note: While Pydantic and SQLAlchemy can be used together effectively, tools like SQLModel provide a more integrated solution by combining the features of both libraries, reducing code duplication and simplifying development. For most use cases, SQLModel is a better alternative.


## Basic Integration

Instead of defining separate SQLAlchemy (`Base`, `Column`) and Pydantic (`BaseModel`) classes, SQLModel lets you define a single class that handles both responsibilities.

```py
from sqlmodel import Field, SQLModel, create_engine

# Define a model that serves as both a database table and a Pydantic schema
class User(SQLModel, table=True):
    id: int | None = Field(default=None, primary_key=True)
    name: str
    email: str

engine = create_engine('sqlite:///./test.db')
SQLModel.metadata.create_all(engine)

```

In this setup, the `User` class validates incoming data like a Pydantic model while mapping directly to the database like a SQLAlchemy model.

---

## CRUD Operations

Because SQLModel classes inherit from Pydantic's `BaseModel`, incoming request data is automatically validated against the model fields before any database transaction occurs.

```py
from fastapi import FastAPI, Depends, HTTPException
from sqlmodel import Session

app = FastAPI()

def get_session():
    with Session(engine) as session:
        yield session

@app.post('/users/')
def create_user(user: User, session: Session = Depends(get_session)):
    session.add(user)
    session.commit()
    session.refresh(user)

    return user

```

This ensures data is validated and saved with minimal boilerplate.

## Advanced Usage: Model Inheritance

In traditional SQLAlchemy + Pydantic integrations, you often need manual helper functions (like `to_pydantic`) to convert database instances into validation schemas.

SQLModel solves this cleanly through **class inheritance**. You can define base models, database models, and response models separately without duplicating fields or writing custom conversion utilities:

```py
# Shared properties
class UserBase(SQLModel):
    name: str
    email: str

# Database model (includes table configuration)
class User(UserBase, table=True):
    id: int | None = Field(default=None, primary_key=True)

# Schema for incoming data (if validation differs)
class UserCreate(UserBase):
    pass

# Schema for public responses (ensures fields like passwords or IDs are handled properly)
class UserPublic(UserBase):
    id: int

```

## Async Integration

SQLModel fully supports SQLAlchemy's asynchronous features (`create_async_engine` and `AsyncSession`) for high-performance async applications:

```py
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.orm import sessionmaker

async_engine = create_async_engine('sqlite+aiosqlite:///./test.db')
async_session_maker = sessionmaker(
    async_engine, class_=AsyncSession, expire_on_commit=False
)

@app.post('/users/')
async def create_user_async(user_in: UserCreate):
    async with async_session_maker() as session:
        async with session.begin():
            # Convert the input schema to a database User model
            db_user = User.model_validate(user_in)
            session.add(db_user)
            await session.commit()
            await session.refresh(db_user)

            return db_user

```

This approach maintains the full performance benefits of asynchronous Python web applications while keeping your data models unified and clean.
