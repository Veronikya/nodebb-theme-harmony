<div class="btn-group bottom-sheet{{{ if !filters.length }}} hidden{{{ end }}}">
	<button type="button" class="btn-ghost-sm d-flex gap-2 align-items-baseline dropdown-toggle" data-bs-toggle="dropdown">
		<i class="fa fa-fw fa-filter link-primary"></i>
		<span class="visible-md-inline visible-lg-inline fw-semibold">{selectedFilter.name}</span>
	</button>
	<ul class="dropdown-menu" role="menu">
		{{{each filters}}}
		<li role="presentation" class="category {{{if filters.selected}}}selected{{{end}}}">
			<a class="dropdown-item" role="menu-item" href="{config.relative_path}/{filters.url}"><i class="fa fa-fw {{{ if filters.selected }}}fa-check{{{ end }}}"></i>{filters.name}</a>
		</li>
		{{{end}}}
	</ul>
</div>