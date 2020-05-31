from genshi.template import MarkupTemplate

tpl_xml = """
<doc xmlns:py="http://genshi.edgewall.org/">

<p py:for="i in data">${i}</p>

</doc>
"""

tpl = MarkupTemplate(tpl_xml)
stream = tpl.generate(data=xrange(10000))

with open('output.xml', 'w') as f:
    stream.render(out=f)
