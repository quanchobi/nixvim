{
  plugins.otter = {
    enable = true;
    # Activated for markdown by the FileType autocmd in modules/autocmd.nix. autoActivate
    # calls otter.activate() on every LspAttach in every buffer instead.
    autoActivate = false;
    settings = {
      buffers.set_filetype = true;
      lsp.diagnostic_update_events = [
        "BufWritePost"
      ];
    };
  };
}
