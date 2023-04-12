<div class="d-flex flex-column gap-3" itemid="{url}" itemscope itemtype="https://schema.org/DiscussionForumPosting">
	<div class="row">
		<div class="topic {{{ if widgets.sidebar.length }}}col-lg-9 col-sm-12{{{ else }}}col-lg-12{{{ end }}}">
            {{{ if config.usePagination }}}
			<!-- IMPORT partials/paginator.tpl -->
			{{{ end }}}

			<div class="d-flex gap-0 gap-lg-5">
				<ul component="topic" class="posts timeline mt-sm-2 p-0 py-3" style="min-width: 0;" data-tid="{tid}" data-cid="{cid}">
					{{{each posts}}}
						<li component="post" class="pt-4 {{{ if posts.deleted }}}deleted{{{ end }}} {{{ if posts.selfPost }}}self-post{{{ end }}} {{{ if posts.topicOwnerPost }}}topic-owner-post{{{ end }}}" <!-- IMPORT partials/data/topic.tpl -->>
							<a component="post/anchor" data-index="{./index}" id="{increment(./index, "1")}"></a>

							<meta itemprop="datePublished" content="{./timestampISO}">
							<meta itemprop="dateModified" content="{./editedISO}">

							<!-- IMPORT topic_mh_post.tpl -->
						</li>
					{{{end}}}
				</ul>
			</div>

			{{{ if browsingUsers }}}
			<div class="visible-xs">
				<!-- IMPORT partials/topic/browsing-users.tpl -->
				<hr/>
			</div>
			{{{ end }}}

            {{{ if config.usePagination }}}
			<!-- IMPORT partials/paginator.tpl -->
			{{{ end }}}


		</div>

	</div>
</div>

{{{ if !config.usePagination }}}
<noscript>
<!-- IMPORT partials/paginator.tpl -->
</noscript>
{{{ end }}}

