<ul component="category" class="list-unstyled topic-list overflow-auto position-relative" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}" data-set="{set}">

	{{{ each topics }}}
	<li component="category/topic" class="category-item position-relative {function.generateTopicClass}" <!-- IMPORT partials/data/category.tpl -->>
		<link itemprop="url" content="{config.relative_path}/topic/{./slug}" />
		<meta itemprop="name" content="{function.stripTags, ./title}" />
		<meta itemprop="itemListOrder" content="descending" />
		<meta itemprop="position" content="{./index}" />
		<a id="{./index}" data-index="{./index}" component="topic/anchor"></a>

		<div class="row">
			<div class="col-md-7 col-sm-9 col-12 content d-flex">
				<div class="me-3">
					<div class="avatar">
						<a href="{{{ if ./user.userslug }}}{config.relative_path}/user/{./user.userslug}{{{ else }}}#{{{ end }}}" class="text-decoration-none">
							{{{ if ./thumbs.length }}}
							<img class="topic-thumb rounded-1" width="150" height="auto" src="{./thumbs.0.url}" class="not-responsive" />
							{{{ else }}}
							{buildAvatar(./user, "40px", true, "avatar-tooltip not-responsive")}
							{{{ end }}}
						</a>
					</div>
				</div>
				<div class="d-flex flex-column gap-1">
					<h2 component="topic/header" class="text-break title mb-1 {{{ if showSelect }}}me-4{{{ end }}} me-md-0 text-md fw-bold">
						{{{ if topics.noAnchor }}}
						<span>{./title}</span>
						{{{ else }}}
						<a class="text-reset" href="{config.relative_path}/topic/{./slug}{{{ if ./bookmark }}}/{./bookmark}{{{ end }}}">{./title}</a>
						{{{ end }}}
					</h2>
					<div class="info d-flex align-items-center flex-wrap">
						<span component="topic/labels" class="d-flex mb-1">
							<span component="topic/scheduled" class="me-2 badge border border-gray-300 text-primary {{{ if !./scheduled }}}hidden{{{ end }}}">
								<i class="fa fa-clock-o"></i>
								[[topic:scheduled]]
							</span>
							<span component="topic/pinned" class="me-2 badge border border-gray-300 text-primary {{{ if (./scheduled || !./pinned) }}}hidden{{{ end }}}">
								<i class="fa fa-thumb-tack"></i>
								{{{ if !./pinExpiry }}}[[topic:pinned]]{{{ else }}}[[topic:pinned-with-expiry, {./pinExpiryISO}]]{{{ end }}}
							</span>
							<span component="topic/locked" class="me-2 badge border border-gray-300 text-primary {{{ if !./locked }}}hidden{{{ end }}}">
								<i class="fa fa-lock"></i>
								[[topic:locked]]
							</span>
							<span class="me-2 badge border border-gray-300 text-primary {{{ if !./oldCid }}}hidden{{{ end }}}">
								<i class="fa fa-arrow-circle-right"></i>
								[[topic:moved]]
							</span>
							{{{each ./icons}}}<span class="me-2">{@value}</span>{{{end}}}
						</span>


						{{{ if !template.category }}}
						<a class="lh-1 me-2 mb-1" href="{config.relative_path}/category/{./category.slug}">{function.buildCategoryLabel, ./category, "border"}</a>
						{{{ end }}}

						{{{ if ./tags.length }}}
						<span class="lh-1 tag-list hidden-xs d-flex flex-wrap gap-2 me-2 mb-1 ">
							{{{ each ./tags }}}
							<a href="{config.relative_path}/tags/{./valueEncoded}"><span class="badge border border-gray-300 text-xs fw-normal tag tag-class-{./class}" data-tag="{./value}">{./valueEscaped}</span></a>
							{{{ end }}}
						</span>
						{{{ end }}}

						<span class="hidden-xs text-xs timeago text-muted me-2 mb-1" title="{./timestampISO}"></span>

						<span class="visible-xs-inline timeago text-muted text-xs" title="{{{ if ./teaser.timestampISO }}}{./teaser.timestampISO}{{{ else }}}{./timestampISO}{{{ end }}}"></span>
					</div>
				</div>
			</div>

			<div class="meta row col-md-5 col-sm-3 d-none d-md-flex align-self-stretch align-self-lg-start">
				<div class="col-lg-5 d-none d-lg-flex stats text-muted gap-2 px-0">
					{{{ if !reputation:disabled }}}
					<div class="stats-votes flex-1">
						<div class="align-items-center card card-header px-0 py-2 border-0 rounded-1">
							<span class="human-readable-number fs-5 fw-semibold ff-secondary lh-1" title="{./votes}" data-toFixed="0">{./votes}</span>
							<span class="text-lowercase text-xs">[[global:votes]]</span>
						</div>
					</div>
					{{{ end }}}
					<div class="stats-postcount flex-1">
						<div class="align-items-center card card-header px-0 py-2 border-0 rounded-1">
							<span class="human-readable-number fs-5 fw-semibold ff-secondary lh-1" title="{./postcount}" data-toFixed="0">{./postcount}</span>
							<span class="text-lowercase text-xs">[[global:posts]]</span>
						</div>
					</div>
					<div class="stats-viewcount flex-1">
						<div class="align-items-center card card-header px-0 py-2 border-0 rounded-1">
							<span class="human-readable-number fs-5 fw-semibold ff-secondary lh-1" title="{./viewcount}" data-toFixed="0">{./viewcount}</span>
							<span class="text-lowercase text-xs">[[global:views]]</span>
						</div>
					</div>
				</div>

				<div class="col-lg-7 col-md-12 teaser d-none d-md-block overflow-hidden" component="topic/teaser">
					<div class="lastpost background-link-container border-start border-2 h-100" style="border-color: {./category.bgColor}!important;">
						<a class="background-link" href="{config.relative_path}/topic/{./slug}/{./teaser.index}"></a>
						{{{ if ./unreplied }}}
						<p class="ps-3 text-xs lh-1">
							[[category:no_replies]]
						</p>
						{{{ else }}}
						{{{ if ./teaser.pid }}}
						<p class="ps-3 mb-0 lh-1">
							<a href="{config.relative_path}/user/{./teaser.user.userslug}" class="text-decoration-none">{buildAvatar(./teaser.user, "18px", true, "avatar-tooltip not-responsive")}</a>
							<a class="permalink text-muted timeago text-xs" href="{config.relative_path}/topic/{./slug}/{./teaser.index}" title="{./teaser.timestampISO}">
							</a>
						</p>
						<div class="post-content overflow-hidden text-xs line-clamp-2 ps-3">
							{./teaser.content}
						</div>
						{{{ end }}}
						{{{ end }}}
					</div>
				</div>
			</div>

			{{{ if showSelect }}}
			<div class="position-absolute top-0 end-0 w-auto p-0">
				<i component="topic/select" class="fa fa-square-o fs-5 text-muted pointer"></i>
			</div>
			{{{ end }}}
		</div>
		<hr class="text-muted opacity-25"/>
	</li>
	{{{end}}}
</ul>
