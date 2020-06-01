from genshi.template import MarkupTemplate

tpl_xml = """
<doc xmlns:py="http://genshi.edgewall.org/">

<p>
    <li py:for="i in data">
        ${i}s
    </li>
</p>

</doc>
"""

tpl = MarkupTemplate(tpl_xml)

stream = tpl.generate(data=[1, 2, 3, 4])

with open('output2.xml', 'w') as f:
    stream.render(out=f)
