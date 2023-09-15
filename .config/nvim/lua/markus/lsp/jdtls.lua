local jdtls = require("mason-registry").get_package("jdtls")
local jdtls_path = jdtls:get_install_path()

--'-configuration', '/path/to/jdtls_install_location/config_SYSTEM',
-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/tmp/jdtls/' .. project_name

local config = {
  cmd = {
    jdtls_path .. '/jdtls'

    --'java',

    --'-Declipse.application=org.eclipse.jdt.ls.core.id1',
    --'-Dosgi.bundles.defaultStartLevel=4',
    --'-Declipse.product=org.eclipse.jdt.ls.core.product',
    --'-Dlog.protocol=true',
    --'-Dlog.level=ALL',
    --'-Xmx1g',
    --'--add-modules=ALL-SYSTEM',
    --'--add-opens', 'java.base/java.util=ALL-UNNAMED',
    --'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    --'--add-modules', 'jdk.incubator.vector',

    --'-jar', jdtls_path .. '/bin/jdtls'
    --'-data', workspace_dir,
    --'-configuration', jdtls_path .. '/config_linux',

  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
  --root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  --settings = {
  --  java = {}
  --},

  ---- Language server `initializationOptions`
  ---- You need to extend the `bundles` with paths to jar files
  ---- if you want to use additional eclipse.jdt.ls plugins.
  ----
  ---- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  ----
  ---- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  --init_options = {
  --  bundles = {}
  --},
}

require('jdtls').start_or_attach(config)
