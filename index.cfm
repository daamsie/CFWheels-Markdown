<cfset MarkdownWheels = {}>
<cfset MarkdownWheels.version = "0.1">
<cfset readMePath = application.wheels.webPath & application.wheels.pluginPath & "/cfmarkdown/README.md" />
<cfset readme=fileRead(expandPath(readMePath)) />
<cfoutput>

<h1>Markdown for CFWheels v#MarkdownWheels.version#</h1>
<p>Markdown rendering in CFWheels</p>

<p>It is a simple wrapper for the very robust MarkdownJ implementation in Java. 
	You will need the Javaloader plugin to get this up and running.</p>
	
<h3>README.md</h3>
<hr />
#markdown(readme)#

</cfoutput>

