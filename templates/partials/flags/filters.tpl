<div component="flags/filters" class="d-flex flex-wrap gap-2 pb-3 border-bottom">
	<div class="btn-group bottom-sheet">
		<a class="filter-btn btn btn-light btn-sm border {{{ if filters.quick }}}active-filter{{{ end }}} dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
			<span class="filter-label">{{{ if filters.quick }}}[[flags:filter-quick-{./filters.quick}]]{{{ else }}}[[flags:quick-filters]]{{{ end }}}</span>
			<span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li>
				<a class="dropdown-item" href="{config.relative_path}/flags?quick=mine">[[flags:filter-quick-mine]]</a>
			</li>
		</ul>
	</div>

	<!-- IMPORT partials/category/filter-dropdown-left.tpl -->

	<div class="btn-group bottom-sheet">
		<a class="filter-btn btn btn-light btn-sm border {{{ if (sort != "newest") }}}active-filter{{{ end }}} dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
			<span class="filter-label">{{{ if (sort != "newest") }}}[[flags:sort-{./sort}]]{{{ else }}}[[flags:sort]]{{{ end }}}</span>
			<span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><h6 class="dropdown-header">[[flags:sort-all]]</h6></li>
			<li class="dropdown-item" data-name="sort" data-value="newest">[[flags:sort-newest]]</li>
			<li class="dropdown-item" data-name="sort" data-value="oldest">[[flags:sort-oldest]]</li>
			<li class="dropdown-item" data-name="sort" data-value="reports">[[flags:sort-reports]]</li>
			<li><h6 class="dropdown-header">[[flags:sort-posts-only]]</h6></li>
			<li class="dropdown-item" data-name="sort" data-value="downvotes">[[flags:sort-downvotes]]</li>
			<li class="dropdown-item" data-name="sort" data-value="upvotes">[[flags:sort-upvotes]]</li>
			<li class="dropdown-item" data-name="sort" data-value="replies">[[flags:sort-replies]]</li>
		</ul>
	</div>

	<div class="btn-group bottom-sheet">
		<a class="filter-btn btn btn-light btn-sm border {{{ if filters.state }}}active-filter{{{ end }}} dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
			<span class="filter-label">{{{ if filters.state }}}[[flags:state-{./filters.state}]]{{{ else }}}[[flags:filter-state]]{{{ end }}}</span>
			<span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li class="dropdown-item" data-name="state" data-value="open">[[flags:state-open]]</li>
			<li class="dropdown-item" data-name="state" data-value="wip">[[flags:state-wip]]</li>
			<li class="dropdown-item" data-name="state" data-value="resolved">[[flags:state-resolved]]</li>
			<li class="dropdown-item" data-name="state" data-value="rejected">[[flags:state-rejected]]</li>
		</ul>
	</div>

	<div class="btn-group bottom-sheet">
		<a class="filter-btn btn btn-light btn-sm border {{{ if filters.type }}}active-filter{{{ end }}} dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
			<span class="filter-label">{{{ if filters.type }}}[[flags:filter-type-{./filters.type}]]{{{ else }}}[[flags:filter-type]]{{{ end }}}</span>
			<span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li class="dropdown-item" data-name="type" data-value="all">[[flags:filter-type-all]]</li>
			<li class="dropdown-item" data-name="type" data-value="post">[[flags:filter-type-post]]</li>
			<li class="dropdown-item" data-name="type" data-value="user">[[flags:filter-type-user]]</li>
		</ul>
	</div>

	<div component="flags/filter/assignee" class="dropdown bottom-sheet" data-filter-name="assignee">
		<a component="user/filter/button" class="filter-btn btn btn-light btn-sm border {{{ if filters.assignee }}}active-filter{{{ end }}} dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
			<span class="filter-label">[[flags:filter-assignee]]</span>
			<span class="caret"></span>
		</a>

		<ul class="dropdown-menu" style="min-width: 350px;">
			<li class="px-3 py-1 d-flex flex-column gap-2">
				<input type="text" class="form-control" component="user/filter/search" placeholder="[[search:type-a-username]]">
				<div component="user/filter/selected" class="d-flex flex-wrap gap-2">
					{{{ each selected.assignee }}}
					<div class="d-flex px-2 py-1 rounded-1 text-bg-primary gap-2 align-items-center text-sm">
						{buildAvatar(@value, "16px", true)} {./username}
						<button component="user/filter/delete" data-uid="{./uid}" class="btn btn-primary btn-sm py-0"><i class="fa fa-times fa-xs"></i></button>
					</div>
					{{{ end }}}
				</div>
				<hr/>
				<div component="user/filter/results" class="d-flex flex-wrap gap-2">
					{{{ each userFilterResults }}}
					<button class="btn btn-light btn-sm border" data-uid="{./uid}" data-username="{./username}">{buildAvatar(@value, "16px", true)} {./username}</button>
					{{{ end }}}
				</div>
			</li>
		</ul>
	</div>

	<div component="flags/filter/reporterId" class="dropdown bottom-sheet" data-filter-name="reporterId">
		<a component="user/filter/button" class="filter-btn btn btn-light btn-sm border {{{ if filters.reporterId }}}active-filter{{{ end }}} dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
			<span class="filter-label">[[flags:filter-reporterId]]</span>
			<span class="caret"></span>
		</a>

		<ul class="dropdown-menu" style="min-width: 350px;">
			<li class="px-3 py-1 d-flex flex-column gap-2">
				<input type="text" class="form-control" component="user/filter/search" placeholder="[[search:type-a-username]]">
				<div component="user/filter/selected" class="d-flex flex-wrap gap-2">
					{{{ each selected.reporterId }}}
					<div class="d-flex px-2 py-1 rounded-1 text-bg-primary gap-2 align-items-center text-sm">
						{buildAvatar(@value, "16px", true)} {./username}
						<button component="user/filter/delete" data-uid="{./uid}" class="btn btn-primary btn-sm py-0"><i class="fa fa-times fa-xs"></i></button>
					</div>
					{{{ end }}}
				</div>
				<hr/>
				<div component="user/filter/results" class="d-flex flex-wrap gap-2">
					{{{ each userFilterResults }}}
					<button class="btn btn-light btn-sm border" data-uid="{./uid}" data-username="{./username}">{buildAvatar(@value, "16px", true)} {./username}</button>
					{{{ end }}}
				</div>
			</li>
		</ul>
	</div>

	<div component="flags/filter/targetUid" class="dropdown bottom-sheet" data-filter-name="targetUid">
		<a component="user/filter/button" class="filter-btn btn btn-light btn-sm border {{{ if filters.targetUid }}}active-filter{{{ end }}} dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
			<span class="filter-label">[[flags:filter-targetUid]]</span>
			<span class="caret"></span>
		</a>

		<ul class="dropdown-menu" style="min-width: 350px;">
			<li class="px-3 py-1 d-flex flex-column">
				<input type="text" class="form-control" component="user/filter/search" placeholder="[[search:type-a-username]]">
				<div component="user/filter/selected" class="d-flex flex-wrap gap-2">
					{{{ each selected.targetUid }}}
					<div class="d-flex px-2 py-1 rounded-1 text-bg-primary gap-2 align-items-center text-sm">
						{buildAvatar(@value, "16px", true)} {./username}
						<button component="user/filter/delete" data-uid="{./uid}" class="btn btn-primary btn-sm py-0"><i class="fa fa-times fa-xs"></i></button>
					</div>
					{{{ end }}}
				</div>
				<hr/>
				<div component="user/filter/results" class="d-flex flex-wrap gap-2">
					{{{ each userFilterResults }}}
					<button class="btn btn-light btn-sm border" data-uid="{./uid}" data-username="{./username}">{buildAvatar(@value, "16px", true)} {./username}</button>
					{{{ end }}}
				</div>
			</li>
		</ul>
	</div>

	<div component="flags/filters/reset" class="ms-auto">
		<a class="filter-btn btn btn-warning btn-sm border {{{ if !hasFilter }}}btn-light disabled{{{ end }}}" href="{config.relative_path}/flags" role="button">
			<span class="filter-label">[[flags:filter-reset]]</span>
		</a>
	</div>

	<div class="btn-group float-end" component="flags/bulk-actions">
		<button class="filter-btn btn btn-light btn-sm border" data-bs-toggle="dropdown" autocomplete="off" aria-haspopup="true" aria-expanded="false" disabled="disabled">
			<span class="filter-label">[[flags:bulk-actions]]</span>
		</button>
		<ul class="dropdown-menu">
			<li><a href="#" class="dropdown-item" data-action="bulk-assign">[[flags:assign-to-me]]</a></li>
			<li><a href="#" class="dropdown-item" data-action="bulk-mark-resolved">[[flags:bulk-resolve]]</a></li>
		</ul>
	</div>

	<form role="form">
		<input type="hidden" name="sort" value="{./sort}" />
		<input type="hidden" name="state" value="{./filters.state}" />
		<input type="hidden" name="type" value="{./filters.type}" />
	</form>
</div>