<ul class="post-copyright">
  <li class="post-copyright-author">
    <strong>{{ __('post.copyright.author') + __('symbol.colon') }} </strong>{#
  #}{{ post.author | default(author) }}{#
#}</li>
  <li class="post-copyright-link">
    <strong>{{ __('post.copyright.link') + __('symbol.colon') }}</strong>
    <a href="{{ post.url | default(post.permalink) }}" title="{{ post.title }}">{{ post.url | default(post.permalink) }}</a>
  </li>
  {% if time_diff -%}
  <li class="post-updated">
    <strong>{{ __('post.copyright.post_lastupdate') + __('symbol.colon') }}</strong>{#
  #} @{{- date(post.updated) -}}@{{- time(post.updated) -}}{#
#}</li>
  {%- endif -%}
  <li class="post-copyright-license">
    <strong>{{ __('post.copyright.license_title') + __('symbol.colon') }} </strong>{#
  #}{{ __('post.copyright.license_content', theme.post_copyright.license) }}{#
#}</li>
</ul>
