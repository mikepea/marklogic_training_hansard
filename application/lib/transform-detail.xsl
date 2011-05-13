<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" exclude-result-prefixes="html" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:html="http://www.w3.org/1999/xhtml">
  <xsl:output omit-xml-declaration="yes" indent="yes"/>
  <xsl:template match="ColumnReference"><div class="render-ColumnReference"><xsl:apply-templates/></div></xsl:template>
  <xsl:template match="Question"><div class="render-Question"><xsl:apply-templates/></div></xsl:template>
  <xsl:template match="Statement"><div class="render-Statement"><xsl:apply-templates/></div></xsl:template>
  <xsl:template match="StatementParagraph"><div class="render-StatementParagraph"><xsl:apply-templates/></div></xsl:template>
  <xsl:template match="Written-Statement"><div class="render-Written-Statement"><xsl:apply-templates/></div></xsl:template>
  <xsl:template match="Date"><span class="render-Date"><xsl:apply-templates/></span></xsl:template>
  <xsl:template match="Questioner"><span class="render-Questioner"><xsl:apply-templates/></span></xsl:template>
  <xsl:template match="Questioner-Constituency"><span class="render-Questioner-Constituency"><xsl:apply-templates/></span></xsl:template>
  <xsl:template match="Questioner-Party"><span class="render-Questioner-Party"><xsl:apply-templates/></span></xsl:template>
  <xsl:template match="QuestionParagraph"><span class="render-QuestionParagraph"><xsl:apply-templates/></span></xsl:template>
  <xsl:template match="Speaker"><span class="render-Speaker"><xsl:apply-templates/></span></xsl:template>
  <xsl:template match="Speaker-Constituency"><span class="render-Speaker-Constituency"><xsl:apply-templates/></span></xsl:template>
  <xsl:template match="Speaker-Party"><span class="render-Speaker-Party"><xsl:apply-templates/></span></xsl:template>
  <xsl:template match="Topic"><span class="render-Topic"><xsl:apply-templates/></span></xsl:template>
  <xsl:template match="html:*"><xsl:copy><xsl:copy-of select="@*"/><xsl:apply-templates/></xsl:copy></xsl:template>
</xsl:stylesheet>