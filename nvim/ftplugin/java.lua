local config = {
	cmd = {
		"java",

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"-javaagent:" .. "/home/frank/.local/share/nvim/mason/packages/jdtls/lombok.jar",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-jar",
		"/home/frank/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.600.v20231106-1826.jar",

		"-configuration",
		"/home/frank/.local/share/nvim/mason/packages/jdtls/config_linux",

		"-data",
		"/home/frank/IdeaProjects/",
	},
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
	settings = {
		java = {},
	},
	init_options = {
		bundles = {},
	},
}

require("jdtls").start_or_attach(config)
