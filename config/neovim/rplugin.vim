" node plugins


" python3 plugins
call remote#host#RegisterPlugin('python3', '/home/eric/.config/nvim/plugged/denite.nvim/rplugin/python3/denite', [
      \ {'sync': v:true, 'name': '_denite_init', 'opts': {}, 'type': 'function'},
      \ {'sync': v:true, 'name': '_denite_start', 'opts': {}, 'type': 'function'},
      \ {'sync': v:true, 'name': '_denite_do_action', 'opts': {}, 'type': 'function'},
     \ ])
call remote#host#RegisterPlugin('python3', '/home/eric/.config/nvim/plugged/deoplete.nvim/rplugin/python3/deoplete', [
      \ {'sync': v:false, 'name': '_deoplete_init', 'opts': {}, 'type': 'function'},
     \ ])


" ruby plugins


" python plugins


