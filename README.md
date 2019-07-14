# `iri`

An interactive Emacs front-end for Ruby API reference.

It provides an interactive way to query Ruby API docs.  Under the hood, it is essentially `comint-mode` running `ri`.
- It is derived from `comint-mode`, so that all those familiar key strokes are inherited. (If you don't know `comint-mode`, you may know `shell-mode` which is also derived from `comint-mode`).
- It directly calls `ri` (Ruby's built-in command-line tool for API reference) instead of dealing with the docs itself, so that compatibility is maximized.

## Example Usage

- `M-x iri` to bring up the interactive `*iri*` buffer. 
<p align="center"> <img src="docs/start-iri.png" title="Start iri" width="260"> </p>

- Input your query.
<p align="center"> <img src="docs/input-query1.png" title="Input a query" width="260"> </p>

- Input another query.
<p align="center"> <img src="docs/input-query2.png" title="Input another query" width="260"> </p>

- If the output is too long, you can use `C-c C-r` to goto the head of the last output.
<p align="center"> <img src="docs/goto-head.png" title="Goto the output head" width="260"> </p>

- Besides `C-c C-r`, all the other `comint-mode` key strokes can be used.  For example,
  - `C-c C-p`: jump to the previous output
  - `C-c C-n`: jump to the next output
  - `C-c C-e`: jump back to the input field
  - `M-r`: search previous input
  - `M-p`: previous input
  - `M-n`: next input
  - ... (use `C-h m` to see more!)
