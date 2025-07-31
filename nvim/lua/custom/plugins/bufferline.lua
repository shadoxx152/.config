-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {}
  end,

  keys = {
    { 'H', '<cmd>BufferLineCyclePrev<cr>', mode = 'n', desc = 'prev buffer' },
    { 'L', '<cmd>BufferLineCycleNext<cr>', mode = 'n', desc = 'next buffer' },
  },
}
