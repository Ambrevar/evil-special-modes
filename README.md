# Evil Special Modes

This is a collection of [Evil](https://github.com/emacs-evil/evil) bindings for
_the rest of Emacs_ the Evil mode does not cover by default, such as
`help-mode`, `M-x calendar`, Eshell and more.

**Warning:** This project is still in an early development phase, expect some
changes in the default binding in the future.


## Goals

1. Reduce binding context switching: As soon as "moving around" gets hardwired
to `<hjkl>`, it becomes frustratingly inefficient not to have it everywhere.

2. Consistency: Having all bindings in one place allows for enforcing
consistency across special modes and coordinating the community work at defining
a reference implementation.

3. Community work: setting up bindings is tremendous work and joining force can
only save hours for all of Evil users out there.  While not everyone would agree
on the bindings, it helps to have something to start with rather than nothing at
all.  In the end, users are free to tweak the package settings to fit their
taste best.


## Installation

- Clone or download this repository.
- Modify your `load-path`:

```
(add-to-list 'load-path (expand-file-name "/path/to/evil-special-modes/" user-emacs-directory))
```

- Register the bindings, either all at once:

```
(when (require 'evil-special-modes nil t)
  (evil-special-modes-init))
```

or mode-by-mode, for instance

  (with-eval-after-load 'calendar (require 'evil-calendar))

The list of supported modes is simply the list of files.


## Guidelines

The following rules serve as guiding principles to define the set of standard
Evil bindings for various modes.  Since special modes are by definition
structurally incomparable, those rules cannot be expected to be applied
universally.

The rules are sorted by priority.

0. Don't bind anything to `:` nor `<escape>`.

1. Keep the movement keys when possible and sensible.

	- `h`, `j`, `k`, `l`
	- `w`, `W`, `b`, `B`, `e`, `E`, `ge`, `gE`
	- `f`, `F`, `t`, `T`, `;`, `,`
	- `gg`, `G`
	- `|`
	- `(`, `)`
	- `{`, `}`
	- `%`
	- `+`, `-`, `0`, `^`, `$`
	- `C-i`, `C-o`

2. Keep the search keys when possible and sensible.

	- `/`, `?`
	- `#`, `*`

3. Keep the yanking and register keys when possible and sensible.

	- `y`, `Y`
	- `"`

4. Keep the mark keys when possible and sensible.

	- `m`
	- `'`, `\``

5. Keep the windowing keys when possible and sensible.

	- `H`, `L`, `M`
	- `C-e`, `C-y`
	- `C-f`, `C-b`
	- `C-d`, `C-u`
	- `C-w`-prefixed bindings.
	- Some `z`-prefixed bindings (see below).

6. The following keys are free when insert-mode does not make sense in the
current mode:

	- `a`, `A`, `i`, `I`
	- `c`, `C`, `r`, `R`, `s`, `S`
	- `d`, `D`, `x`, `X`
	- `o`, `O`
	- `p`, `P`
	- `=`, `<`, `>`
	- `J`
	- `~`

	Any of those keys can be set to be a prefix key.

7. Prefix keys: `g` and `z` are the ubiqutous prefix keys.

	- `g` generally stangs for "go" and is best used for movements.
	- `z` is used for scrolling, folding, spell-checking and more.

8. [WIP] Macro and action keys (Work-in-progress, see below)

	- `@`, `q`
	- `.`


## Work in progress

### Should `C-h` ever be remapped?

- In Vim, `C-h` works as backspace, but Evil does not follow that behaviour.

- In Emacs, it is a prefix key for all help-related commands, and so is `<f1>`.

- `hjkl` can be used for atomic movements, `HJKL` can usually not be used
because `H`, `K` and `L` are all universal (`J` is `evil-join` and usually does
not make sense in special modes).  As such, the next best candidates are
`C-<hjkl>` (`C-j` and `C-k` are already used by `evil-magit`) and `M-<hjkl>`.
If we follow `evil-magit`, or if we need both `C-<hjkl>` and `M-<hjkl>`, we must
remap `C-h`.

### The state of `q`

In Vim, `q` is for recording macros.  In most Emacs special modes, it stands for
quitting, which macros are recorded/played with `<f3>` and `<f4>`.
Vim quits with `ZZ` or `ZQ`.

### Modes left behind

Some modes might still remain unsupported by this package.  Should you be
missing your `<hjkl>`, feel free to file an issue or even a pull request.


## Third-party packages

To keep the goals of this package within reach, we restrict the changes brought
by this package to vanilla Emacs modes.
Third-party packages are provided by several parties:

- Ediff: https://github.com/emacs-evil/evil-ediff
- Magit: https://github.com/emacs-evil/evil-magit
- Org-mode: https://github.com/GuiltyDolphin/org-evil or https://github.com/Somelauw/evil-org-mode

Should you know any suitable package not mentioned in this list, let us know and
file an issue.
