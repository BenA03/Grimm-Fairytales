<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" version="3.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>

    <!-- This xslt calculates the percentages of the descriptors -->

    <xsl:variable name="allCollection" as="document-node()+"
        select="collection('../../sorted_markup/?recurse=yes;select=*.xml')"/>
    <xsl:variable name="laterCollection" as="document-node()+" select="collection('../../sorted_markup/1819-1857?select=*.xml')"/>
    <xsl:variable name="earlierCollection" as="document-node()+" select="collection('../../sorted_markup/1812-1815?select=*.xml')"/>
    
    <xsl:template name="xsl:initial-template">
        <!-- male -->
        <xsl:variable name="allMale1" as="xs:integer"
            select="count($earlierCollection//descriptor[@gender = 'male'])"/>
        <xsl:variable name="posMale1" as="xs:integer"
            select="count($earlierCollection//descriptor[@gender = 'male' and @type = 'positive'])"/>
        <xsl:variable name="neutMale1" as="xs:integer"
            select="count($earlierCollection//descriptor[@gender = 'male' and @type = 'neutral'])"/>
        <xsl:variable name="negMale1" as="xs:integer"
            select="count($earlierCollection//descriptor[@gender = 'male' and @type = 'negative'])"/>
        
        <xsl:variable name="allMale2" as="xs:integer"
            select="count($laterCollection//descriptor[@gender = 'male'])"/>
        <xsl:variable name="posMale2" as="xs:integer"
            select="count($laterCollection//descriptor[@gender = 'male' and @type = 'positive'])"/>
        <xsl:variable name="neutMale2" as="xs:integer"
            select="count($laterCollection//descriptor[@gender = 'male' and @type = 'neutral'])"/>
        <xsl:variable name="negMale2" as="xs:integer"
            select="count($laterCollection//descriptor[@gender = 'male' and @type = 'negative'])"/>
        
        <xsl:variable name="allMale3" as="xs:integer"
            select="count($allCollection//descriptor[@gender = 'male'])"/>
        <xsl:variable name="posMale3" as="xs:integer"
            select="count($allCollection//descriptor[@gender = 'male' and @type = 'positive'])"/>
        <xsl:variable name="neutMale3" as="xs:integer"
            select="count($allCollection//descriptor[@gender = 'male' and @type = 'neutral'])"/>
        <xsl:variable name="negMale3" as="xs:integer"
            select="count($allCollection//descriptor[@gender = 'male' and @type = 'negative'])"/>

        <!-- Female -->
        <xsl:variable name="allFemale1" as="xs:integer"
            select="count($earlierCollection//descriptor[@gender = 'female'])"/>
        <xsl:variable name="posFemale1" as="xs:integer"
            select="count($earlierCollection//descriptor[@gender = 'female' and @type = 'positive'])"/>
        <xsl:variable name="neutFemale1" as="xs:integer"
            select="count($earlierCollection//descriptor[@gender = 'female' and @type = 'neutral'])"/>
        <xsl:variable name="negFemale1" as="xs:integer"
            select="count($earlierCollection//descriptor[@gender = 'female' and @type = 'negative'])"/>
        
        <xsl:variable name="allFemale2" as="xs:integer"
            select="count($laterCollection//descriptor[@gender = 'female'])"/>
        <xsl:variable name="posFemale2" as="xs:integer"
            select="count($laterCollection//descriptor[@gender = 'female' and @type = 'positive'])"/>
        <xsl:variable name="neutFemale2" as="xs:integer"
            select="count($laterCollection//descriptor[@gender = 'female' and @type = 'neutral'])"/>
        <xsl:variable name="negFemale2" as="xs:integer"
            select="count($laterCollection//descriptor[@gender = 'female' and @type = 'negative'])"/>
        
        <xsl:variable name="allFemale3" as="xs:integer"
            select="count($allCollection//descriptor[@gender = 'female'])"/>
        <xsl:variable name="posFemale3" as="xs:integer"
            select="count($allCollection//descriptor[@gender = 'female' and @type = 'positive'])"/>
        <xsl:variable name="neutFemale3" as="xs:integer"
            select="count($allCollection//descriptor[@gender = 'female' and @type = 'neutral'])"/>
        <xsl:variable name="negFemale3" as="xs:integer"
            select="count($allCollection//descriptor[@gender = 'female' and @type = 'negative'])"/>

        <!-- Mixed -->
        <xsl:variable name="allMix1" as="xs:integer"
            select="count($earlierCollection//descriptor[@gender = 'mixed'])"/>
        <xsl:variable name="posMix1" as="xs:integer"
            select="count($earlierCollection//descriptor[@gender = 'mixed' and @type = 'positive'])"/>
        <xsl:variable name="neutMix1" as="xs:integer"
            select="count($earlierCollection//descriptor[@gender = 'mixed' and @type = 'neutral'])"/>
        <xsl:variable name="negMix1" as="xs:integer"
            select="count($earlierCollection//descriptor[@gender = 'mixed' and @type = 'negative'])"/>
        
        <xsl:variable name="allMix2" as="xs:integer"
            select="count($laterCollection//descriptor[@gender = 'mixed'])"/>
        <xsl:variable name="posMix2" as="xs:integer"
            select="count($laterCollection//descriptor[@gender = 'mixed' and @type = 'positive'])"/>
        <xsl:variable name="neutMix2" as="xs:integer"
            select="count($laterCollection//descriptor[@gender = 'mixed' and @type = 'neutral'])"/>
        <xsl:variable name="negMix2" as="xs:integer"
            select="count($laterCollection//descriptor[@gender = 'mixed' and @type = 'negative'])"/>
        
        <xsl:variable name="allMix3" as="xs:integer"
            select="count($allCollection//descriptor[@gender = 'mixed'])"/>
        <xsl:variable name="posMix3" as="xs:integer"
            select="count($allCollection//descriptor[@gender = 'mixed' and @type = 'positive'])"/>
        <xsl:variable name="neutMix3" as="xs:integer"
            select="count($allCollection//descriptor[@gender = 'mixed' and @type = 'neutral'])"/>
        <xsl:variable name="negMix3" as="xs:integer"
            select="count($allCollection//descriptor[@gender = 'mixed' and @type = 'negative'])"/>

        <!-- Results -->
        <stats>
        <earlierEdition>
            <male>
                <positive><xsl:value-of select="$posMale1 div $allMale1 * 100"/></positive>
                <neutral><xsl:value-of select="$neutMale1 div $allMale1 * 100"/></neutral>
                <negative><xsl:value-of select="$negMale1 div $allMale1 * 100"/></negative>
            </male>
            <female>
                <positive><xsl:value-of select="$posFemale1 div $allFemale1 * 100"/></positive>
                <neutral><xsl:value-of select="$neutFemale1 div $allFemale1 * 100"/></neutral>
                <negative><xsl:value-of select="$negFemale1 div $allFemale1 * 100"/></negative>
            </female>
            <mixed>
                <positive><xsl:value-of select="$posMix1 div $allMix1 * 100"/></positive>
                <neutral><xsl:value-of select="$neutMix1 div $allMix1 * 100"/></neutral>
                <negative><xsl:value-of select="$negMix1 div $allMix1 * 100"/></negative>
            </mixed>
        </earlierEdition>
        <laterEdition>
            <male>
                <positive><xsl:value-of select="$posMale2 div $allMale2 * 100"/></positive>
                <neutral><xsl:value-of select="$neutMale2 div $allMale2 * 100"/></neutral>
                <negative><xsl:value-of select="$negMale2 div $allMale2 * 100"/></negative>
            </male>
            <female>
                <positive><xsl:value-of select="$posFemale2 div $allFemale2 * 100"/></positive>
                <neutral><xsl:value-of select="$neutFemale2 div $allFemale2 * 100"/></neutral>
                <negative><xsl:value-of select="$negFemale2 div $allFemale2 * 100"/></negative>
            </female>
            <mixed>
                <positive><xsl:value-of select="$posMix2 div $allMix2 * 100"/></positive>
                <neutral><xsl:value-of select="$neutMix2 div $allMix2 * 100"/></neutral>
                <negative><xsl:value-of select="$negMix2 div $allMix2 * 100"/></negative>
            </mixed>
        </laterEdition>
        <allEdition>
            <male>
                <positive><xsl:value-of select="$posMale3 div $allMale3 * 100"/></positive>
                <neutral><xsl:value-of select="$neutMale3 div $allMale3 * 100"/></neutral>
                <negative><xsl:value-of select="$negMale3 div $allMale3 * 100"/></negative>
            </male>
            <female>
                <positive><xsl:value-of select="$posFemale3 div $allFemale3 * 100"/></positive>
                <neutral><xsl:value-of select="$neutFemale3 div $allFemale3 * 100"/></neutral>
                <negative><xsl:value-of select="$negFemale3 div $allFemale3 * 100"/></negative>
            </female>
            <mixed>
                <positive><xsl:value-of select="$posMix3 div $allMix3 * 100"/></positive>
                <neutral><xsl:value-of select="$neutMix3 div $allMix3 * 100"/></neutral>
                <negative><xsl:value-of select="$negMix3 div $allMix3 * 100"/></negative>
            </mixed>
        </allEdition>
        </stats>
    </xsl:template>


</xsl:stylesheet>
