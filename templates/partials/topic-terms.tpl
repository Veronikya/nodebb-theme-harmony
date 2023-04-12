<div class="btn-group bottom-sheet {{{ if !terms.length }}}hidden{{{ end }}}">
	<button type="button" class="btn-ghost-sm d-flex gap-2 align-items-baseline dropdown-toggle" data-bs-toggle="dropdown">
		<i class="fa fa-fw fa-clock text-primary"></i>
		<span class="visible-md-inline visible-lg-inline fw-semibold">{selectedTerm.name}</span>
	</button>
	<ul class="dropdown-menu" role="menu">
		{{{each terms}}}
		<li role="presentation" class="category">
			<a class="dropdown-item" role="menu-item" href="{config.relative_path}/{terms.url}"><i class="fa fa-fw {{{ if terms.selected }}}fa-check{{{ end }}}"></i>{terms.name}</a>
		</li>
		{{{end}}}
	</ul>
</div>