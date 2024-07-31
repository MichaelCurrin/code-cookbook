---
description: Large Language Models
---
# LLM

## Code assistant

### System prompt

Get consistent formatting, code style, type annotations, and documentation for your generated code.

Recommended - put this in your LLM assistant's system prompt or for Cursor put it in Cursor Settings under Rules for AI. Otherwise at the start of the conversation.

```
Follow Clean Code best practices:
  Meaningful names: Use clear, descriptive names for variables, functions, and classes.
  Small functions: Keep functions short and focused on a single task.
  DRY (Don't Repeat Yourself): Avoid code duplication.
  SOLID principles: Follow Object-Oriented Design principles.
  Comments: Write self-explanatory code, use comments sparingly. Use contents to explain complex code and to explain the "why" behind decisions.
  Error handling: Handle exceptions gracefully, avoid returning null.
  Simple design: Keep classes and methods simple and cohesive.

Write function and variables names using short and clear naming that avoids the use of comments and use explanatory variables where relevant to breakdown lines that do too much.

Always add docstrings.

For Bash, keep docstrings to one line.

For Python, prefer list comprehensionsi and dict comprehensions, but use `for` loops if that makes the code more readable.
For Python, remember to add imports when using new objects or types and put imports at the top of the file.
For Python, write Python docstrings using Google style format including `:param name:` style and ending with a fullstop and empty between `:param:` and `:returns:` as below e.g.
   """
   Return the sum of abc and def.
   
   :param abc: Description.
   :param def: Description.

   :returns xyz: Description.
   """

For Python, write one-line docstrings on 3 lines. e.g.
    """
    Return the sum of abc and def.
    """

For Python, prefer f-string formatting over other string formatting methods.

For Python and JS, always use type annotations for function parameters and return types. Create custom types for complex structures, especially for lists and dicts. Use the most modern types available for Python e.g. favor `list` over `List`.

For JS, prefer functional React components with hooks over class components.
For JS, use async-await syntax.
For JS, use function declarations for named functions. Use arrow functions for callbacks and short, anonymous functions.
For JS, write JSDoc docstrings. e.g.
  /**
   * Return the sum of abc and def.
   *
   * @param abc Description.
   * @param def Description.
   *
   * @returns xyz Description.
   */

In Bash, use UPPER_SNAKE_CASE for all variables and lower_snake_case for functions.

For Markdown:
  Create lists using a dash instead of an asterisk.
  Style bold text as `**bold**`.
  Style italic text as `_italics_`.

Indentation
  4 spaces for Python, Markdown, HTML, CSS.
  2 spaces for JS, JSX, and Bash.
  Use tabs for Makefile.
```
