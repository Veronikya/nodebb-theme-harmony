{{{ if (!./index && widgets.mainpost-header.length) }}}
<div data-widget-area="mainpost-header">
	{{{ each widgets.mainpost-header }}}
	{widgets.mainpost-header.html}
	{{{ end }}}
</div>
{{{ end }}}

<div class="d-flex align-items-start gap-3">
	<div class="icon py-1 bg-body d-none d-sm-block">
		<a class="d-inline-block position-relative text-decoration-none" href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}">
			{buildAvatar(posts.user, "48px", true, "", "user/picture")}
			<span component="user/status" class="position-absolute translate-middle-y badge border border-white border-2 rounded-circle status {posts.user.status}"><span class="visually-hidden">[[global:{posts.user.status}]]</span></span>
		</a>
	</div>

	<div class="post-container d-flex flex-grow-1 flex-column w-100" style="min-width: 0;">
		<div class="d-flex align-items-center gap-1 flex-wrap w-100 post-header mt-1" itemprop="author" itemscope itemtype="https://schema.org/Person">
			<div class="icon bg-body d-sm-none">
				<a class="d-inline-block position-relative text-decoration-none" href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}">
					{buildAvatar(posts.user, "20px", true, "", "user/picture")}
					<span component="user/status" class="position-absolute translate-middle-y badge border border-white border-2 rounded-circle status {posts.user.status}"><span class="visually-hidden">[[global:{posts.user.status}]]</span></span>
				</a>
			</div>

			<span class="text-nowrap">
				<a class="fw-bold" href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}" itemprop="name" data-username="{posts.user.username}" data-uid="{posts.user.uid}">{posts.user.displayname}</a>
			</span>

			{{{ each posts.user.selectedGroups }}}
			{{{ if posts.user.selectedGroups.slug }}}
			<!-- IMPORT partials/groups/badge.tpl -->
			{{{ end }}}
			{{{ end }}}

			{{{ if posts.user.banned }}}
			<span class="badge bg-danger rounded-1">[[user:banned]]</span>
			{{{ end }}}

			<div class="d-flex gap-1 hidden-xs align-items-center">
				<span class="text-muted">
				{{{ if posts.toPid }}}
				{generateRepliedTo(@value, config.timeagoCutoff)}
				{{{ else }}}
				{generateWrote(@value, config.timeagoCutoff)}
				{{{ end }}}
				</span>

				<i component="post/edit-indicator" class="fa fa-edit text-muted{{{ if privileges.posts:history }}} pointer{{{ end }}} edit-icon {{{ if !posts.editor.username }}}hidden{{{ end }}}" title="[[global:edited-timestamp, {./editedISO}]]"></i>
				<span data-editor="{posts.editor.userslug}" component="post/editor" class="visually-hidden">[[global:last_edited_by, {posts.editor.username}]] <span class="timeago" title="{posts.editedISO}"></span></span>
			</div>

			<div>
				<span>
					{{{ if posts.user.custom_profile_info.length }}}
					&#124;
					{{{ each posts.user.custom_profile_info }}}
					{posts.user.custom_profile_info.content}
					{{{ end }}}
					{{{ end }}}
				</span>
			</div>
			<div class="d-flex align-items-center gap-1 flex-grow-1 justify-content-end">
				<span class="bookmarked opacity-0 text-primary"><i class="fa fa-bookmark-o"></i></span>
				<a href="{config.relative_path}/post/{./pid}" class="post-index text-muted d-none d-md-inline">#{increment(./index, "1")}</a>
			</div>
		</div>

		<div class="content mt-2 text-break" component="post/content" itemprop="text">
			{posts.content}
		</div>
	</div>
</div>

<div component="post/footer" class="post-footer border-bottom pb-2">
	{{{ if posts.user.signature }}}
	<div component="post/signature" data-uid="{posts.user.uid}" class="text-xs text-muted mt-2">{posts.user.signature}</div>
	{{{ end }}}

	<div class="clearfix">
		{{{ if !hideReplies }}}
		<a component="post/reply-count" data-target-component="post/replies/container" href="#" class="d-flex gap-2 align-items-center mt-2 btn-outline border rounded-1 p-1 threaded-replies user-select-none float-start text-muted text-decoration-none {{{ if !posts.replies.count }}}hidden{{{ end }}}">
			<span component="post/reply-count/avatars" class="avatars d-inline-flex gap-1 align-items-top {{{ if posts.replies.hasMore }}}hasMore{{{ end }}}">
				{{{each posts.replies.users}}}
				<span>{buildAvatar(posts.replies.users, "20px", true, "avatar-tooltip")}</span>
				{{{end}}}
				{{{ if posts.replies.hasMore}}}
				<span><i class="fa fa-ellipsis"></i></span>
				{{{ end }}}
			</span>

			<span class="ms-2 replies-count fw-semibold" component="post/reply-count/text" data-replies="{posts.replies.count}">{posts.replies.text}</span>
			<span class="ms-2 replies-last hidden-xs fw-semibold">[[topic:last_reply_time]] <span class="timeago" title="{posts.replies.timestampISO}"></span></span>

			<i class="fa fa-fw fa-chevron-down" component="post/replies/open"></i>
			<i class="fa fa-fw fa-chevron-up hidden" component="post/replies/close"></i>
			<i class="fa fa-fw fa-spin fa-spinner hidden" component="post/replies/loading"></i>
		</a>
		{{{ end }}}
	</div>

	<div component="post/replies/container" class="my-2 col-11 border rounded-1 p-3"></div>

</div>

{{{ if (!./index && widgets.mainpost-footer.length) }}}
<div data-widget-area="mainpost-footer">
	{{{ each widgets.mainpost-footer }}}
	{widgets.mainpost-footer.html}
	{{{ end }}}
</div>
{{{ end }}}