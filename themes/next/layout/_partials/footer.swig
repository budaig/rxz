<div class="copyright">{#
#}{%- set current = date(Date.now(), "YYYY") %}{#
#}&copy; {%- if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }}-{%- endif %}{#
#}<span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love" id="animate">
    <i class="fa fa-{{ theme.footer.icon.name }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder"><a href="{{ config.root }}">{{ theme.footer.copyright || author }}</a></span>

  {%- if theme.footer.beian.enable %}
  <span class="with-love" id="animate"> 
    <i class="fa fa-{{ theme.footer.icon.name2 }}"></i>
  </span>
  <span class="author" itemprop="ICPHolder"><a class="theme-link" target="_blank"{{ nofollow }} href="{{ theme.footer.beian.ICP_url }}" title="{{ theme.footer.beian.ICP_text }}">{{ theme.footer.beian.ICP_license }}</a></span>
  {%- endif %}

  {%- if config.symbols_count_time.total_symbols %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {%- if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.count_total') + __('symbol.colon') }}</span>
    {%- endif %}
    <span title="{{ __('symbols_count_time.count_total') }}">{#
    #}{{ symbolsCountTotal(site) }}{#
  #}</span>
  {%- endif %}

  {%- if config.symbols_count_time.total_time %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-coffee"></i>
    </span>
    {%- if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.time_total') }} &asymp;</span>
    {%- endif %}
    <span title="{{ __('symbols_count_time.time_total') }}">{#
    #}{{ symbolsTimeTotal(site, theme.symbols_count_time.awl, theme.symbols_count_time.wpm, __('symbols_count_time.time_minutes')) }}{#
  #}</span>
  {%- endif %}
</div>

{%- if theme.footer.powered.enable %}
  <div class="powered-by">{#
  #}{{ __('footer.powered', next_url('https://hexo.io', 'Hexo', {class: 'theme-link'})) }}{#
  #}{%- if theme.footer.powered.version %} v{{ hexo_env('version') }}{%- endif %}{#
 #}</div>
{%- endif %}

{%- if theme.footer.powered.enable and theme.footer.customhost.enable %}
  <span class="post-meta-divider">|</span>
{%- endif %}

{%- if theme.footer.customhost.enable %}
  <div class="powered-by">{#
  #}{{ theme.footer.customhost.customhost_text }}{#
#}</div>
{%- endif %}

{%- if theme.footer.customhost.enable and theme.footer.theme.enable %}
  <span class="post-meta-divider">|</span>
{%- endif %}

{%- if theme.footer.theme.enable %}
  <div class="theme-info">{#
  #}{{ __('footer.theme') }} – {{ next_url('https://theme-next.org', 'NexT.' + theme.scheme, {class: 'theme-link'}) }}{#
  #}{%- if theme.footer.theme.version %} v{{ version }}{%- endif %}{#
#}</div>
{%- endif %}

{{- next_inject('footer') }}
