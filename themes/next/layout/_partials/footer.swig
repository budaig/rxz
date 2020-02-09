<div class="copyright">
  {% set copyright_year = date(null, 'YYYY') %}
  &copy; {% if theme.footer.since and theme.footer.since != copyright_year %}{{ theme.footer.since }}-{% endif %}
  <span itemprop="copyrightYear">{{ copyright_year }}</span>
  <span class="with-love">
    <i class="fa fa-{{ theme.footer.icon.name }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder"><a href="{{ config.root }}">{{ theme.footer.copyright or author }}</a></span>

  {%- if theme.footer.beian.enable %}
  <span class="with-love" id="animate">
    <i class="fa fa-{{ theme.footer.icon.name2 }}"></i>
  </span>
  {{ next_url('http://www.beian.miit.gov.cn', theme.footer.beian.icp + ' ') }}
  {%- if theme.footer.beian.gongan_icon_url %}<span><img src="{{ theme.footer.beian.gongan_icon_url }}" style="display:inline-block;"/>
  {%- endif %}
    {%- if theme.footer.beian.gongan_id and theme.footer.beian.gongan_num %}
      {{- next_url('http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=' + theme.footer.beian.gongan_id, theme.footer.beian.gongan_num + ' ') }}
    {%- endif %}
  {%- endif %}

  {%- if config.symbols_count_time.total_symbols %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {%- if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.count_total') + __('symbol.colon') }}</span>
    {%- endif %}
    <span title="{{ __('symbols_count_time.count_total') }}">{{ symbolsCountTotal(site) }}</span>
  {%- endif %}

  {%- if config.symbols_count_time.total_time %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-coffee"></i>
    </span>
    {%- if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.time_total') }} &asymp;</span>
    {%- endif %}
    <span title="{{ __('symbols_count_time.time_total') }}">{{ symbolsTimeTotal(site, theme.symbols_count_time.awl, theme.symbols_count_time.wpm, __('symbols_count_time.time_minutes')) }}</span>
  {%- endif %}
</div>

{%- if theme.footer.powered.enable %}
  <div class="powered-by">
    {{- __('footer.powered', next_url('https://hexo.io', 'Hexo', {class: 'theme-link'})) }}
    {%- if theme.footer.powered.version %} v{{ hexo_version }}{%- endif %}
  </div>
{%- endif %}

{%- if theme.footer.powered.enable and theme.footer.customhost.enable %}
  <span class="post-meta-divider">|</span>
{%- endif %}

{%- if theme.footer.customhost.enable %}
  <div class="powered-by">
    {{ theme.footer.customhost.customhost_text }}
  </div>
{%- endif %}

{%- if theme.footer.customhost.enable and theme.footer.theme.enable %}
  <span class="post-meta-divider">|</span>
{%- endif %}

{%- if theme.footer.theme.enable %}
  <div class="theme-info">
    {%- set next_site = 'https://theme-next.org' %}
    {%- if theme.scheme !== 'Gemini' %}
      {%- set next_site = 'https://' + theme.scheme | lower + '.theme-next.org' %}
    {%- endif %}
    {{- __('footer.theme') }} – {{ next_url(next_site, 'NexT.' + theme.scheme, {class: 'theme-link'}) }}
    {%- if theme.footer.theme.version %} v{{ next_version }}{%- endif %}
  </div>
{%- endif %}

{%- if theme.add_this_id %}
  <div class="addthis_inline_share_toolbox">
    <script src="//s7.addthis.com/js/300/addthis_widget.js#pubid={{ theme.add_this_id }}" async="async"></script>
  </div>
{%- endif %}

{%- if theme.needmoreshare2.float.enable %}
  <div id="needsharebutton-float">
    <span class="btn">
      <i class="fa fa-share-alt" aria-hidden="true"></i>
    </span>
  </div>
{%- endif %}

{%- set needmoreshare2_js_uri = theme.vendors.needmoreshare2_js | default(next_vendors('needsharebutton/needsharebutton.js')) %}
<script src="{{ needmoreshare2_js_uri }}"></script>
<script>
  {%- if theme.needmoreshare2.postbottom.enable %}
    pbOptions = {};
    {%- for k,v in theme.needmoreshare2.postbottom.options %}
      pbOptions.{{ k }} = "{{ v }}";
    {%- endfor %}
    new needShareButton('#needsharebutton-postbottom', pbOptions);
  {%- endif %}
  {%- if theme.needmoreshare2.float.enable %}
    flOptions = {};
    {%- for k,v in theme.needmoreshare2.float.options %}
      flOptions.{{ k }} = "{{ v }}";
    {%- endfor %}
    new needShareButton('#needsharebutton-float', flOptions);
  {%- endif %}
</script>
 <!--/add needmoreshare2 in post-->

{{- next_inject('footer') }}
