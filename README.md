# Evil Special Modes

This is a collection of [Evil](https://github.com/emacs-evil/evil) bindings for
_the rest of Emacs_ that Evil does not cover by default, such as `help-mode`,
`M-x calendar`, Eshell and more.

**Warning:** This project is still in an early development phase, expect some
changes in the default bindings in the future.



## Goals

1. Reduce context switching: As soon as "moving around" gets hardwired
to `<hjkl>`, it becomes frustratingly inefficient not to have it everywhere.

2. Community work: setting up bindings is tremendous work and joining force can
only save hours for all of Evil users out there.  While not everyone may agree
on the chosen bindings, it helps to have something to start with rather than
nothing at all.  In the end, users are free to override a subset of the proposed
bindings to best fit their needs.

3. Consistency: Having all bindings defined in one place allows for enforcing
consistency across special modes and coordinating the community work to define a
reference implementation.



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

The rules are more-or-less sorted by priority.

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

2. Keep the yanking and register keys when possible and sensible.

	- `y`, `Y`
	- `"`

3. Keep the search keys when possible and sensible.

	- `/`, `?`
	- `#`, `*`

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

7. Prefix keys: `g` and `z` are the ubiquitous prefix keys.

	- `g` generally stands for "go" and is best used for movements.
	- `z` is used for scrolling, folding, spell-checking and more.

8. Macro and action keys (Work-in-progress, see below)

	- `@`, `q`
	- `.`



## Rationale (Work in progress)

Many special modes share the same set of similar actions.  Those actions should
share the same bindings across all modes whenever feasible.

### Motion (`[`, `]`, `{`, `}`, `(`, `)`, `C-j`, `C-k`)

- `[` and `]`: Use `[[` and `]]` for navigation between sections.

	If the mode makes no difference between the end of a section and the beginning
of the next, use `[` and `]`.

- `C-j`, `C-k`: If there is granularity, i.e. subsections, use `C-j` and `C-k`
to browse them.  This reflects [evil-magit][] and [evil-mu4e][] default
bindings.

- `{`, `}`: If there is no paragraph structure, `{` and `}` can be used for sub-sectioning.

- `(`, `)`: If there is no sentence structure, `(` and `)` can be used for sub-sectioning.


- `HJKL`: `hjkl` can be used for atomic movements, but `HJKL` can usually not be used
because `H`, `K` and `L` are all universal (`J` is `evil-join` and usually
does not make sense in special modes).

- `C-h`, `C-l`: Since we have `C-j` and `C-k` for vertical motion, it would
make sense to use `C-h` and `C-l` for horizontal motion.  There are some
shortcomings though:

	- In Vim, `C-h` works as backspace, but Evil does not follow that behaviour.

	- In Emacs, it is a prefix key for all help-related commands, and so is `<f1>`.

- `M-<hjkl>`: Those keys are usually free in Evil but still bound to there Emacs
default (e.g. `M-l` is `downcase-word`).  Besides, if `C-j`/`C-k` are
already used, having `M-j` and `M-k` might add up to the confusion.

**Question**: Should `C-h` ever be remapped?

### Quitting (`q`, `ZQ`, `ZZ`)

In Vim, `q` is for recording macros.  In most Emacs special modes, it stands for
quitting while macros are recorded/played with `<f3>` and `<f4>`.
Vim quits with `ZZ` or `ZQ`.

A good rule of thumb would be:

- Always bind `ZZ` and `ZQ` to the quitting function(s), `evil-quit` if nothing
  else makes sense.

- Bind `q` to `evil-quit` if macros don't make sense in current mode.

- If macros don't make sense in current mode, then `@` is available.

### Reverting (`gr`)

`gr` seems to be widely accepted.

### Marking

Emacs inconsistently uses "u" and "U" to unmark.  Since in Vim those keys are
usually bound to "undo", they are probably best left to commands that undo
actions in the buffer and not undo marks.

`m` defaults to `evil-set-marker` which might not be very useful in special
modes.  This is somewhat debatable though.

Suggested mark bindings:

- `m`: Mark or toggle mark, depending on what the mode offers.

- `~`: Toggle all mark.  This mirrors the "invert-char" Vim command bound to `~`
by default.

- `M`: Remove all marks.

- `%`: Mark regexp.

- `x`: Execute action on marks.  This mirrors Dired's binding of `x`.

**Question:** Since `'` is free, why not using it instead of `x` to execute
actions on marks?

Optionally:

- `*`: Mark all, because `*` is traditionally a wild card.

- `#`: Remove mark.  This is useful when we want to unmark a region having both
marked and unmarked entries.  But `M` could also be made to remove all marks on
region, making this binding useless.

### Filtering

`s` and `S` seem to be used in some places like [mu4e][].

- `s`: [s]elect/filter candidates according to a pattern.

- `S`: Remove filter and select all.

- `=` is also free and its significance is obvious.

- `|` is not free but the pipe symbolic is very tantalizing.

### Sorting

- `o`: Change the sort [o]rder.
- `O`: Sort in reverse order.

package-menu uses `S`.

proced and Dired use `s`.

profiler uses `A` and `D`.

[ranger][http://www.nongnu.org/ranger/] uses `o`.

### Interactive "goto" (`gd` and `.`)

- `gd`: [g]o to [d]efinition.

- `.`: go to current entity (day for calendar, playing track for [EMMS][]).
Bind only if more relevant than `evil-repeat`.

### Browse URL (`gu`)

`gu`: [d] to [U]RL.

Normally bound to `evil-downcase` which makes little sense in most special
modes.

**Question:** Used anywhere?

### Help (`?`)

If searching makes sense, keep `?` for backward search.
If not, it can be used to display help.

### History browsing (`C-n`, `C-p`)

`C-n` and `C-p` are standard bindings to browse the history elements.



## Modes left behind

Some modes might still remain unsupported by this package.  Should you be
missing your `<hjkl>`, feel free to file an issue or even a pull request.



## Third-party packages

To keep the goals of this package within reach, we restrict the changes brought
by this package to vanilla Emacs modes.
Third-party packages are provided by several parties:

- [evil-ediff][]
- [evil-magit][]
- [evil-mu4e][]
- Org-mode: https://github.com/GuiltyDolphin/org-evil or https://github.com/Somelauw/evil-org-mode

Should you know any suitable package not mentioned in this list, let us know and
file an issue.

Other references:

- [Spacemacs](http://spacemacs.org)
- [Doom Emacs](https://github.com/hlissner/doom-emacs)

[EMMS]: https://www.gnu.org/software/emms/
[evil-ediff]: https://github.com/emacs-evil/evil-ediff
[evil-magit]: https://github.com/emacs-evil/evil-magit
[evil-mu4e]: https://github.com/JorisE/evil-mu4e
[mu4e]: https://www.djcbsoftware.nl/code/mu/mu4e.html
