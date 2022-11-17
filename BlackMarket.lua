-- ============================================================= --
-- BLACK MARKET MOD
-- ============================================================= --

Chainsaw.postLoad = Utils.overwrittenFunction(Chainsaw.postLoad, function(self, superFunc, ...)
    local retVal = superFunc(self, ...)
	print("INCREASED CHAINSAW CUT SIZE")
	local newSize = 2.2
	if self.cutSizeY < newSize then self.cutSizeY = newSize end
	if self.cutSizeZ < newSize then self.cutSizeZ = newSize end
    return retVal
end)

BaseMission.onFinishedLoading = Utils.overwrittenFunction(BaseMission.onFinishedLoading, function(self, superFunc, ...)
    local retVal = superFunc(self, ...)
	if g_splitTypeManager.typesByName~=nil and g_splitTypeManager.typesByName.GIANTSEQUOIA~=nil then
		print("BLACK MARKET FOR GIANT SEQUOIA")
		g_splitTypeManager.typesByName.GIANTSEQUOIA.woodChipsPerLiter = 3
		g_splitTypeManager.typesByName.GIANTSEQUOIA.volumeToLiter = 1000
		g_splitTypeManager.typesByName.GIANTSEQUOIA.allowsWoodHarvester = true
	end
    return retVal
end)