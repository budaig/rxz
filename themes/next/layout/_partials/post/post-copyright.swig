{%- set ccIcon = '<i class="fab fa-fw fa-creative-commons"></i>' %}
{%- set ccText = theme.creative_commons.license | upper %}

<div>
<ul class="post-copyright">
  <li class="post-copyright-author">
    <strong>{{ __('post.copyright.author') + __('symbol.colon') }} </strong>
    {{- page.author or author }}
  </li>
  <li class="post-copyright-link">
    <strong>{{ __('post.copyright.link') + __('symbol.colon') }}</strong>
    {{ next_url(page.permalink, page.permalink, {title: page.title}) }}
  </li>

  {%- if date_diff and theme.post_lastupdate.enable %}
  <li class="post-updated">
    <strong>{{ __('post.copyright.post_lastupdate') + __('symbol.colon') }}</strong>{#
  #} {{ date(post.updated) -}}@{{ time(post.updated) -}}{#
#}</li>
  {%- endif %}

  <li class="post-copyright-license">
    <strong>{{ __('post.copyright.license_title') + __('symbol.colon') }} </strong>
    {{- __('post.copyright.license_content', next_url(ccURL, ccIcon + ccText)) }}
  </li>
</ul>
</div>
