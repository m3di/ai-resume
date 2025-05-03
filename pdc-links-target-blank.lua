-- pdc-links-target-blank.lua
-- Add target="_blank" to all external links in HTML output

function Link(el)
  -- Only modify links in HTML output
  if FORMAT:match 'html' then
    -- Check if the link is external by looking for http/https protocol
    if el.target:match('^https?://') then
      -- Set attributes for external links
      el.attributes['target'] = '_blank'
      el.attributes['rel'] = 'noopener noreferrer'
    end
  end
  return el
end

