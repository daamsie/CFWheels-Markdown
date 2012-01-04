<cfset MarkdownWheels = {}>
<cfset MarkdownWheels.version = "0.1">

<cfoutput>

<h1>Markdown for CFWheels v#MarkdownWheels.version#</h1>
<p>Markdown rendering in CFWheels</p>

<p>It is a simple wrapper for the very robust MarkdownJ implementation in Java. 
	You will need the Javaloader plugin to get this up and running.</p>
	
<p><span style="color:red;">Important:</span> To get this up and running, copy the 
	markdownj.jar file from wheels_root/plugins/markdown/ into the wheels_root/lib/ folder. 
	Otherwise Javaloader won't find it.</p>
</cfoutput>

