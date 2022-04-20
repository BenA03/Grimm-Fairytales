<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    
    <!-- -->
    <xsl:variable name="fairytales" as="document-node()+"
        select="collection('../../Grimm-fairytales/sorted_markup/1812-1815/?select=*.xml')"/>
    
    <xsl:variable name="barWidth" as="xs:integer" select="75"/>
    <xsl:variable name="barSpacing" as="xs:float" select="$barWidth div 2"/>
    <xsl:variable name="relCount" as="xs:integer"
        select="count(distinct-values($fairytales//metadata/body/p/action))"/>
    <xsl:variable name="xLength" as="xs:float" select="$relCount * ($barWidth + $barSpacing)"/>
    <xsl:variable name="yScale" as="xs:integer" select="400"/>
    <xsl:variable name="actions" as="element()*" select="$fairytales//action"/>
    
    <xsl:template name="xsl:initial-template">
        <svg viewBox="100 0 1200 600" width="100%">
            <g transform="translate(200, 500)">
                <xsl:apply-templates select="$fairytales//action" mode="actionType"/>
                <!-- ==================== AXES BELOW ==================== -->
                <g>
                    <text x="{$xLength div 2 - 150}" y="-{$yScale + 25}" font-weight="bold"
                        stroke="#E0E0E0" fill="#E0E0E0">Fairytales 1812-1815</text>
                    <text x="{$xLength div 2 - 125}" y="{60}" font-weight="bold" stroke="#E0E0E0"
                        fill="#E0E0E0">Relationship between insulter and insultee</text>
                    <text x="200" y="-75" transform="rotate(-90)" font-weight="bold"
                        stroke="#E0E0E0" fill="#E0E0E0">% of insults</text>
                    <!-- I have no idea how to center text -->
                    <line x1="0" y1="0" x2="{$xLength}" y2="0" stroke="#E0E0E0"/>
                    <line x1="0" y1="0" x2="0" y2="-{$yScale}" stroke="#E0E0E0"/>
                    <xsl:for-each select="(1 to ($yScale div 100))">
                        <line x1="0" y1="-{. * 100}" x2="{$xLength}" y2="-{. * 100}"
                            stroke="#E0E0E0" stroke-dasharray="3"/>
                        <text x="-45" y="-{. * 100 - 5}" stroke="#E0E0E0" fill="#E0E0E0"
                            ><xsl:value-of select=". * 25"/>%</text>
                    </xsl:for-each>
                    <!-- ==================== LEGEND BELOW ==================== -->
                    <g>
                        <rect x="{$xLength + 20}" y="-{$yScale div 4}" height="15" width="15"
                            fill="#5D81B9"/>
                        <text x="{$xLength + 45}" y="-{$yScale div 4 - 12.5}" stroke="#E0E0E0"
                            fill="#E0E0E0">Active</text>
                        <rect x="{$xLength + 20}" y="-{$yScale div 4 * 2}" height="15" width="15"
                            fill="yellow"/>
                        <text x="{$xLength + 45}" y="-{$yScale div 4 * 2 - 12.5}" stroke="#E0E0E0"
                            fill="#E0E0E0">Passive</text>
                        <rect x="{$xLength + 20}" y="-{$yScale div 4 * 3}" height="15" width="15"
                            fill="#870C1D"/>
                        <text x="{$xLength + 45}" y="-{$yScale div 4 * 3 - 12.5}" stroke="#E0E0E0"
                            fill="#E0E0E0">Male</text>
                        <text x="{$xLength + 45}" y="-{$yScale div 4 - 12.5}" stroke="#E0E0E0"
                            fill="#E0E0E0">Female</text>
                        <rect x="{$xLength + 20}" y="-{$yScale div 4 * 2}" height="15" width="15"
                            fill="light pink"/>
                        <text x="{$xLength + 45}" y="-{$yScale div 4 - 12.5}" stroke="#E0E0E0"
                            fill="#E0E0E0">Eager</text>
                        <rect x="{$xLength + 20}" y="-{$yScale div 4 * 2}" height="15" width="15"
                            fill="pink"/>
                        <text x="{$xLength + 45}" y="-{$yScale div 4 - 12.5}" stroke="#E0E0E0"
                            fill="#E0E0E0">Hesitant</text>
                        <rect x="{$xLength + 20}" y="-{$yScale div 4 * 2}" height="15" width="15"
                            fill="light blue"/>
                        <text x="{$xLength + 45}" y="-{$yScale div 4 - 12.5}" stroke="#E0E0E0"
                                fill="#E0E0E0">Neutral</text>
                        <rect x="{$xLength + 20}" y="-{$yScale div 4 * 2}" height="15" width="15"
                            fill="light orange"/>
                    </g>
                </g>
            </g>
        </svg>
    </xsl:template>
    
    <xsl:template match="$fairytales/*" mode="actionType">
        <xsl:variable name="actionTotal" as="xs:integer" select="count(//action)"/>
        <xsl:variable name="curActions" as="node()+" select="//action"/>
        <g transform="translate({$barSpacing}, 0)">
            <xsl:for-each select="1 to $relCount">               
                <xsl:variable name="i" as="xs:integer" select="."/>
                <xsl:variable name="relType" as="xs:string"
                    select="distinct-values($fairytales//action/@agency)[$i]"/>
                <xsl:variable name="agencyActiveTotal" as="xs:integer"
                    select="count($curActions[@agency = 'active'])"/>
                <xsl:variable name="agencyPassiveTotal" as="xs:integer"
                    select="count($curActions[@agency = 'passive'])"/>
                <xsl:variable name="relType" as="xs:string"
                    select="distinct-values($fairytales//action/@gender)[$i]"/>
                <xsl:variable name="genderMaleTotal" as="xs:integer"
                    select="count($curActions[@gender = 'male'])"/>
                <xsl:variable name="genderFemaleTotal" as="xs:integer"
                    select="count($curActions[@gender = 'female'])"/>
                <xsl:variable name="relType" as="xs:string"
                    select="distinct-values($fairytales//action/@willingness)[$i]"/>
                <xsl:variable name="willingnessEagerTotal" as="xs:integer"
                    select="count($curActions[@willingness = 'eager'])"/>
                <xsl:variable name="willingnessHesitantTotal" as="xs:integer"
                    select="count($curActions[@willingness = 'hesitant'])"/>
                <xsl:variable name="willingnessNeutralTotal" as="xs:integer"
                    select="count($curActions[@willingness = 'neutral'])"/>
               <!-- <xsl:variable name="posHeight" as="xs:float"
                    select="($posTotal div $curActions * $yScale)"/>
                <xsl:variable name="neutralTotal" as="xs:integer"
                    select="count($actions/insult/insultStart[@rel = $relType and @rel-state = 'neutral'])"/>
                <xsl:variable name="neutralHeight" as="xs:float"
                    select="($neutralTotal div $curActions * $yScale)"/>
                <xsl:variable name="negTotal" as="xs:integer"
                    select="count($actions/insult/insultStart[@rel = $relType and @rel-state = 'neg'])"/>
                <xsl:variable name="negHeight" as="xs:float"
                    select="($negTotal div $curActions * $yScale)"/>
                <xsl:for-each select=".">
                    <xsl:sort select="$posTotal" data-type="number" order="descending"/>
                    <rect x="{($i - 1) * ($barWidth + $barSpacing)}" y="-{$posHeight}"
                        height="{$posHeight}" width="{$barWidth}" fill="#5D81B9"/>
                    <rect x="{($i - 1) * ($barWidth + $barSpacing)}"
                        y="-{$neutralHeight + $posHeight}" height="{$neutralHeight}"
                        width="{$barWidth}" fill="gray"/>
                    <rect x="{($i - 1) * ($barWidth + $barSpacing)}"
                        y="-{$negHeight + $posHeight + $neutralHeight}" height="{$negHeight}"
                        width="{$barWidth}" fill="#870C1D"/>
                    <text x="{($i - 1) * ($barWidth + $barSpacing)+ $barWidth div 2}" y="25"
                        text-anchor="middle" stroke="#E0E0E0" fill="#E0E0E0">
                        <xsl:value-of select="$relType"/>
                    </text>
                </xsl:for-each>-->
            </xsl:for-each>
        </g>
    </xsl:template>
</xsl:stylesheet>
