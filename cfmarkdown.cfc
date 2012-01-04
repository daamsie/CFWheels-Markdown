<cfcomponent output="false" mixin="controller">

	<cffunction name="init">
        <cfset this.version = "1.1.7">
		<cfreturn this>
    </cffunction>

	<cffunction name="markdown" access="public" returntype="string" hint="Returns markdown text formatted as HTML" output="false">
		<cfargument name="input" type="string" />
		<cfscript>
			if (not isDefined("variables.MarkdownJ"))
				$loadMarkdownJ();
			return 	variables.MarkdownJ.markdown(arguments.input);
		</cfscript>
	</cffunction>
	
	<!--- PRIVATE FUNCTIONS --->
	
	<cffunction name="$loadMarkdownJ" returntype="void" access="public" output="false" hint="Load MarkdownJ jar if need be">
		<cfscript>
			var loc = {};
			
			loc.relativePluginPath = application.wheels.webPath & application.wheels.pluginPath & "/cfmarkdown/";
			loc.classPath = Replace(Replace(loc.relativePluginPath, "/", ".", "all") & "javaloader", ".", "", "one");
		
			loc.paths = ArrayNew(1);
			loc.paths[1] = ExpandPath(loc.relativePluginPath & "lib/markdownj.jar");
			
			loc.javaLoader = $createObjectFromRoot(path=loc.classPath, fileName="JavaLoader", method="init", loadPaths=loc.paths, loadColdFusionClassPath=false);
			
			variables.MarkdownJ = loc.javaLoader.create('com.petebevin.markdown.MarkdownProcessor').init();
		</cfscript>
	</cffunction>

</cfcomponent>