return {
  -- Dim inactive portions of the code being edited.
  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = function ()
      require("twilight").setup()
    end
  }
}
