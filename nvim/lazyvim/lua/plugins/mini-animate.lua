function isNotSSH()
  local sshConnection = os.getenv("SSH_CONNECTION")
  if sshConnection then
    return true  -- Not an SSH connection
  else
    return false -- SSH connection detected
  end
end

if isNotSSH() then
  return {
    {
      'echasnovski/mini.animate', lazy = true, event = { "LazyFile", "VeryLazy" }, version = '*', enabled = false

    }
  }
else
  return {
    {
      'echasnovski/mini.animate',
      enabled = false,
      lazy=true,
      event = { "LazyFile"},
      version = '*',
      init = function()
        require('mini.animate').setup()
      end,
    },
  }
end
