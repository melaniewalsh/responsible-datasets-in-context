function pdf(args, kwargs)
  local data = pandoc.utils.stringify(args[1]) or pandoc.utils.stringify(kwargs['file'])
  local width = pandoc.utils.stringify(kwargs['width'])
  local height = pandoc.utils.stringify(kwargs['height'])
  local class = pandoc.utils.stringify(kwargs['class'])
  local border = pandoc.utils.stringify(kwargs['border'])
  
  if width ~= '' then
    width = 'width="' .. width .. '" '
  end
  
  if height ~= '' then
    height = 'height="' .. height .. '" '
  end
  
  if class ~= '' then
    class = 'class="' .. class .. '" '
  end
  
  if border ~= '' then
    border = 'border="' .. border .. '" '
  end
  
  -- detect html
  if quarto.doc.isFormat("html:js") then
    return pandoc.RawInline('html', '<object data="' .. data .. '" type="application/pdf"' .. width .. height .. class .. border .. '><iframe src="' .. data .. '" ' .. width .. height .. class .. '>This browser does not support PDFs. Please download the PDF to view it: <a href="' .. data .. '">Download PDF</a></iframe></object>')
  else
    return pandoc.Null()
  end

end

function embedpdf(...)
  return pdf(...)
end

function pdfjs(args, kwargs, ...)
  local data = pandoc.utils.stringify(args[1])
  local class = pandoc.utils.stringify(kwargs['class'])
  
  if class ~= '' then
    class = 'class="' .. class .. '" '
  end
  
  -- detect html
  if quarto.doc.isFormat("html:js") then
    return pandoc.RawInline('html', '<div><iframe src="/pdfjs/web/viewer.html?file=../../' .. data .. '" ' .. class .. '></iframe></div>')
  else
    return pandoc.Null()
  end
  
end
