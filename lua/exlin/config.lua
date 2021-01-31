local config = {
   lua = {single = "--", block_start = "--[[", block_end = "--]]"},
   vim = {single = "\"", block_start = nil, block_end = nil},
}

return {
   config = config
}
