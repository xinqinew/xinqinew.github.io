+++
title = "Basics"
date = 2021-07-26T11:20:25+08:00
weight = 5
chapter = true
pre = "<b>X. </b>"

+++

### Chapter X
description = "我是描述"
2
<!--more-->
{{%expand "外层" %}}内层{{% /expand%}}

{{<mermaid align="left">}} 
	graph LR; 
	A[Hard edge] -->|Link text| B(Round edge) 
	B --> C{Decision} 
	C -->|One| D[Result one] 
	C -->|Two| E[Result two] 
	{{< /mermaid >}}

`editURL` Value : {{% siteparam "editURL" %}}
	
{{% siteparam "editURL" %}}
	
afsf
	
	
{{% siteparam "description" %}}

1
# more
3
# Some Chapter title

哪有

{{% children %}}
一层

{{% children description="true" %}}
描述

{{% children depth="3" showhidden="true" %}}
三层及隐藏

{{% children style="h2" depth="3" description="true" %}}
三层 h2 描述

{{% children style="div" depth="999" %}}
style="div 999层

Lorem Ipsum.