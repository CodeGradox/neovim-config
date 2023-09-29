return {
  -- A cutting-edge motion plugin.
  -- Invoke with "s".
  -- To delete, invoke with "dz", then follow up with the pattern.
  -- To find, invoke with "f".
  -- "ggandor/lightspeed.nvim"
  {
    "ggandor/leap.nvim",
    config = function ()
      require("leap").add_default_mappings()
    end
  }
}
