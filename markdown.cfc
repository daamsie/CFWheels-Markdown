<cfcomponent name="Markdown" output="false" mixin="controller">

	<cffunction name="init">
        <cfset this.version = "1.0,1.1,1.1.7">
		<cfreturn this>
    </cffunction>

	<cffunction name="markdown" access="public" returntype="string" hint="Returns markdown text formatted as HTML">
		<cfargument name="input" type="string" />
		<cfscript>
			if (not isDefined("variables.MarkdownJ"))
				loadMarkdownJ();
			
			return variables.MarkdownJ.markdown(arguments.input);
		</cfscript>
	</cffunction>
	
	<cffunction name="loadMarkdownJ" returntype="void" access="public" output="false">
		<cfscript>
			var loc = {};
			loc.javaLoader = _createJavaLoader();
			
			variables.MarkdownJ = loc.javaLoader.create('com.petebevin.markdown.MarkdownProcessor').init();
		</cfscript>
	</cffunction>
	
	<cffunction name="_createJavaLoader" access="public" output="false" returntype="any">
		<cfscript>
			if (StructKeyExists(server, "javaLoader"))
				return server.javaLoader;
			
			loc.relativePluginPath = application.wheels.webPath & application.wheels.pluginPath & "/markdown/";
			loc.classPath = Replace(Replace(loc.relativePluginPath, "/", ".", "all") & "javaloader", ".", "", "one");
			
			loc.paths = ArrayNew(1);
			loc.paths[1] = ExpandPath(loc.relativePluginPath & "lib/markdownj.jar");
			
			// set the javaLoader to the request in case we use it again
			server.javaLoader = $createObjectFromRoot(path=loc.classPath, fileName="JavaLoader", method="init", loadPaths=loc.paths, loadColdFusionClassPath=false);
		</cfscript>
		<cfreturn server.javaLoader />
	</cffunction>

</cfcomponent>