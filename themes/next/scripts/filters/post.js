/* global hexo */

'use strict';

hexo.extend.filter.register('after_post_render', data => {
  const { config } = hexo;
  const theme = hexo.theme.config;
  const filters = {
    excerpt : theme.auto_excerpt && theme.auto_excerpt.enable && data.excerpt === '',
    exturl  : theme.exturl,
    lazyload: theme.lazyload
  };
  if (!filters.excerpt && !filters.exturl && !filters.lazyload) return;
  const cheerio = require('cheerio');
  const $ = cheerio.load(data.content, {
    decodeEntities: false
  });
  if (filters.lazyload) {
    data.content = data.content.replace(/(<img[^>]*) src=/img, '$1 data-src=');
  }
  if (filters.exturl) {
    const url = require('url');
    var siteHost = url.parse(config.url).hostname || config.url;
    data.content = data.content.replace(/<a[^>]* href="([^"]+)"[^>]*>([^<]+)<\/a>/img, (match, href, html) => {
      // Exit if the href attribute doesn't exists.
      if (!href) return match;

      // Exit if the url has same host with `config.url`, which means it's an internal link.
      var link = url.parse(href);
      if (!link.protocol || link.hostname === siteHost) return match;

      // If title atribute filled, set it as title; if not, set url as title.
      return `<span class="exturl" data-url="${Buffer.from(href).toString('base64')}" title="${href}">${html}<i class="fa fa-external-link"></i></span>`;
    });
  }
  if (filters.excerpt) {
    const elements = $.root().children();
    const _$ = cheerio.load('', {
      decodeEntities: false
    });
    var length = 0;
    elements.each((i, o) => {
      if (length > theme.auto_excerpt.length) return;
      length += $(o).text().length;
      _$.root().append($(o).remove());
    });

    if ($.root().children().length) {
      data.excerpt = _$.html();
      data.more = $.html();
      data.content = data.excerpt + '<a id="more"></a>' + data.more;
    } else {
      data.excerpt = '';
      data.content = _$.html();
      data.more = data.content;
    }
  } else {
    data.content = $.html();
  }

}, 20);
