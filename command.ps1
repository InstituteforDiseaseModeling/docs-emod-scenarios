
function PsScriptBaseName(){
    return (Split-Path -LeafBase $MyInvocation.PSCommandPath)
}