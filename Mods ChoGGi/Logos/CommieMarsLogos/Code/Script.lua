-- See LICENSE for terms

-- Mars Marx, eh close enough
local mod = Mods.ChoGGi_CommieMarxLogos

do -- LoadEntity
	-- no sense in making a new one for each entity
	local entity_template_decal = {
		category_Decors = true,
		entity = {
			fade_category = "Never",
			material_type = "Metal",
		},
	}

	-- local instead of global is quicker
	local EntityData = EntityData
	local EntityLoadEntities = EntityLoadEntities
	local SetEntityFadeDistances = SetEntityFadeDistances

	local function LoadEntity(name,path,mod,template)
		EntityData[name] = entity_template_decal

		EntityLoadEntities[#EntityLoadEntities + 1] = {
			mod,
			name,
			path
		}
		SetEntityFadeDistances(name, -1, -1)
	end

	local ent_path = string.format("%sEntities/%s.ent",mod.env.CurrentModPath,"%s")
	local function LoadDecal(name)
		LoadEntity(
			name,
			ent_path:format(name),
			mod
		)
	end

	LoadDecal("A_flag_for_Space_Communists")
	LoadDecal("A_flag_for_Space_Communists2")
	LoadDecal("Anarcho-Communist_Symbol")
	LoadDecal("Chilean_Communist_Party")
	LoadDecal("China_Emblem_PLA")
	LoadDecal("Chinese_Communist_(1920s)")
	LoadDecal("Coat_of_Arms_Byelorussian_Soviet_Socialist_Republic")
	LoadDecal("Coat_of_arms_of_Bulgaria_(1971-1990)")
	LoadDecal("Coat_of_Arms_of_East_Germany_(1953-1955)")
	LoadDecal("Coat_of_Arms_of_PCR")
	LoadDecal("Coat_of_Arms_of_South_Vietnam_(1954-1955)")
	LoadDecal("Coat_of_Arms_of_the_Popular_Republic_of_Romania_1948")
	LoadDecal("Coat_of_Arms_of_the_Socialist_Republic_of_Bosnia_and_Herzegovina")
	LoadDecal("Coat_of_Arms_of_the_Socialist_Republic_of_Serbia")
	LoadDecal("Coat_of_Arms_of_the_Soviet_Union")
	LoadDecal("Coat_Soviet_Canuck")
	LoadDecal("Colombian_Communist_Party")
	LoadDecal("Communist_Brazil_coat_of_arms")
	LoadDecal("Communist_California")
	LoadDecal("Communist_Party_of_Argentina")
	LoadDecal("Communist_Party_of_Belarus")
	LoadDecal("Communist_Party_of_Brazil")
	LoadDecal("Communist_Party_of_Britain")
	LoadDecal("Communist_Party_of_Canada")
	LoadDecal("Communist_Party_of_Chile")
	LoadDecal("Communist_Party_of_China")
	LoadDecal("Communist_Party_of_Finland")
	LoadDecal("Communist_Party_of_Greece")
	LoadDecal("Communist_Party_of_Ireland")
	LoadDecal("Communist_Party_of_Mexico")
	LoadDecal("Communist_Party_of_Pakistan")
	LoadDecal("Communist_Party_of_Spain")
	LoadDecal("Communist_Party_of_Sweden")
	LoadDecal("Communist_Party_of_the_Russian_Federation")
	LoadDecal("Communist_Party_of_Turkey")
	LoadDecal("Communist_Party_of_Venezuela")
	LoadDecal("Cosmonautica")
	LoadDecal("Cosmonautica_Orange")
	LoadDecal("Emblem_of_North_Korea")
	LoadDecal("Emblem_of_the_Armenian_SSR")
	LoadDecal("Emblem_of_the_Azerbaijan_SSR")
	LoadDecal("Emblem_of_the_Georgian_SSR")
	LoadDecal("Emblem_of_the_Karelo-Finnish_SSR")
	LoadDecal("Emblem_of_the_Kirghiz_SSR")
	LoadDecal("Emblem_of_the_Moldavian_SSR")
	LoadDecal("Emblem_of_the_People's_Republic_of_China")
	LoadDecal("Emblem_of_the_Tajik_SSR")
	LoadDecal("Emblem_of_the_Transcaucasian_SFSR_(1922-1923)")
	LoadDecal("Emblem_of_the_Transcaucasian_SFSR_(1930-1936)")
	LoadDecal("Emblem_of_the_Turkmen_SSR")
	LoadDecal("Emblem_of_the_Ukrainian_SSR")
	LoadDecal("Emblem_of_the_Uzbek_SSR")
	LoadDecal("Emblem_of_Vietnam")
	LoadDecal("Flag_of_North_Korea")
	LoadDecal("Flag_of_the_Hungarian_Communist_Party")
	LoadDecal("Flag_of_Union_State_Space_Agency")
	LoadDecal("Hammer_and_Sickle_Red")
	LoadDecal("Interkosmos_Cuban_Stamp")
	LoadDecal("Interkosmos_Emblem")
	LoadDecal("Interkosmos_Emblem_1977")
	LoadDecal("Interkosmos_Emblem_1980")
	LoadDecal("Interkosmos_Emblem2")
	LoadDecal("Interkosmos_Emblem3")
	LoadDecal("Interkosmos_Patch_1980")
	LoadDecal("Interkosmos_Soyuz-31")
	LoadDecal("Jordanian_Communist_Party")
	LoadDecal("Lebanese_Communist_Party")
	LoadDecal("Mexican_Communist_Party")
	LoadDecal("New_Communist_Party_of_Britain")
	LoadDecal("Orden_Pobeda_Marshal_Vasilevsky")
	LoadDecal("Party_of_Italian_Communists")
	LoadDecal("Party_of_Mexican_Communists")
	LoadDecal("Peoples_Party_of_Panama")
	LoadDecal("Pioneers_Pin")
	LoadDecal("Portuguese_Communist_Party")
	LoadDecal("Progressive_Party_of_Working_People_(Cyprus)")
	LoadDecal("Red_Pride_Galaxywide")
	LoadDecal("Redneck_Commies")
	LoadDecal("Russian_Soviet_Federative_Socialist_Republic")
	LoadDecal("South_African_Communist_Party")
	LoadDecal("Space_Race")
	LoadDecal("Star_Golden_Border")
	LoadDecal("Starry_Plough_flag_(1914)")
	LoadDecal("Swiss_Party_of_Labour")
	LoadDecal("Taiwan_Communist_Party")
	LoadDecal("The_Spectre_of_Communism")
	LoadDecal("United_Socialist_States_of_America")
	LoadDecal("USSR")
	LoadDecal("Workers_of_the_World_Unite")
	LoadDecal("Workers_Party_of_New_Zealand")
	LoadDecal("Zapatismo_Subcommandante_Marcos")

end -- LoadEntity

do -- Postprocess
	local logo_path = string.format("%sUI/%s.png",mod.env.CurrentModPath,"%s")
	local logo_name = "Commie Marx: %s"
	local logo_id = "CommieMarsLogos_%s"

	local PlaceObj = PlaceObj
	local function LoadLogo(name,display)
		PlaceObj("MissionLogoPreset", {
			decal_entity = name,
			entity_name = name,
			display_name = logo_name:format(display),
			id = logo_id:format(name),
			image = logo_path:format(name),
		})
	end

	function OnMsg.ClassesPostprocess()
		LoadLogo("A_flag_for_Space_Communists","A flag for Space Communists")
		LoadLogo("A_flag_for_Space_Communists2","A flag for Space Communists2")
		LoadLogo("Anarcho-Communist_Symbol","Anarcho-Communist Symbol")
		LoadLogo("Chilean_Communist_Party","Chilean Communist Party")
		LoadLogo("China_Emblem_PLA","China Emblem PLA")
		LoadLogo("Chinese_Communist_(1920s)","Chinese Communist (1920s)")
		LoadLogo("Coat_of_Arms_Byelorussian_Soviet_Socialist_Republic","Coat of Arms Byelorussian Soviet Socialist Republic")
		LoadLogo("Coat_of_arms_of_Bulgaria_(1971-1990)","Coat of arms of Bulgaria (1971-1990)")
		LoadLogo("Coat_of_Arms_of_East_Germany_(1953-1955)","Coat of Arms of East Germany (1953-1955)")
		LoadLogo("Coat_of_Arms_of_PCR","Coat of Arms of PCR")
		LoadLogo("Coat_of_Arms_of_South_Vietnam_(1954-1955)","Coat of Arms of South Vietnam (1954-1955)")
		LoadLogo("Coat_of_Arms_of_the_Popular_Republic_of_Romania_1948","Coat of Arms of the Popular Republic of Romania 1948")
		LoadLogo("Coat_of_Arms_of_the_Socialist_Republic_of_Bosnia_and_Herzegovina","Coat of Arms of the Socialist Republic of Bosnia and Herzegovina")
		LoadLogo("Coat_of_Arms_of_the_Socialist_Republic_of_Serbia","Coat of Arms of the Socialist Republic of Serbia")
		LoadLogo("Coat_of_Arms_of_the_Soviet_Union","Coat of Arms of the Soviet Union")
		LoadLogo("Coat_Soviet_Canuck","Coat Soviet Canuck")
		LoadLogo("Colombian_Communist_Party","Colombian Communist Party")
		LoadLogo("Communist_Brazil_coat_of_arms","Communist Brazil coat of arms")
		LoadLogo("Communist_California","Communist California")
		LoadLogo("Communist_Party_of_Argentina","Communist Party of Argentina")
		LoadLogo("Communist_Party_of_Belarus","Communist Party of Belarus")
		LoadLogo("Communist_Party_of_Brazil","Communist Party of Brazil")
		LoadLogo("Communist_Party_of_Britain","Communist Party of Britain")
		LoadLogo("Communist_Party_of_Canada","Communist Party of Canada")
		LoadLogo("Communist_Party_of_Chile","Communist Party of Chile")
		LoadLogo("Communist_Party_of_China","Communist Party of China")
		LoadLogo("Communist_Party_of_Finland","Communist Party of Finland")
		LoadLogo("Communist_Party_of_Greece","Communist Party of Greece")
		LoadLogo("Communist_Party_of_Ireland","Communist Party of Ireland")
		LoadLogo("Communist_Party_of_Mexico","Communist Party of Mexico")
		LoadLogo("Communist_Party_of_Pakistan","Communist Party of Pakistan")
		LoadLogo("Communist_Party_of_Spain","Communist Party of Spain")
		LoadLogo("Communist_Party_of_Sweden","Communist Party of Sweden")
		LoadLogo("Communist_Party_of_the_Russian_Federation","Communist Party of the Russian Federation")
		LoadLogo("Communist_Party_of_Turkey","Communist Party of Turkey")
		LoadLogo("Communist_Party_of_Venezuela","Communist Party of Venezuela")
		LoadLogo("Cosmonautica","Cosmonautica")
		LoadLogo("Cosmonautica_Orange","Cosmonautica Orange")
		LoadLogo("Emblem_of_North_Korea","Emblem of North Korea")
		LoadLogo("Emblem_of_the_Armenian_SSR","Emblem of the Armenian SSR")
		LoadLogo("Emblem_of_the_Azerbaijan_SSR","Emblem of the Azerbaijan SSR")
		LoadLogo("Emblem_of_the_Georgian_SSR","Emblem of the Georgian SSR")
		LoadLogo("Emblem_of_the_Karelo-Finnish_SSR","Emblem of the Karelo-Finnish SSR")
		LoadLogo("Emblem_of_the_Kirghiz_SSR","Emblem of the Kirghiz SSR")
		LoadLogo("Emblem_of_the_Moldavian_SSR","Emblem of the Moldavian SSR")
		LoadLogo("Emblem_of_the_People's_Republic_of_China","Emblem of the People's Republic of China")
		LoadLogo("Emblem_of_the_Tajik_SSR","Emblem of the Tajik SSR")
		LoadLogo("Emblem_of_the_Transcaucasian_SFSR_(1922-1923)","Emblem of the Transcaucasian SFSR (1922-1923)")
		LoadLogo("Emblem_of_the_Transcaucasian_SFSR_(1930-1936)","Emblem of the Transcaucasian SFSR (1930-1936)")
		LoadLogo("Emblem_of_the_Turkmen_SSR","Emblem of the Turkmen SSR")
		LoadLogo("Emblem_of_the_Ukrainian_SSR","Emblem of the Ukrainian SSR")
		LoadLogo("Emblem_of_the_Uzbek_SSR","Emblem of the Uzbek SSR")
		LoadLogo("Emblem_of_Vietnam","Emblem of Vietnam")
		LoadLogo("Flag_of_North_Korea","Flag of North Korea")
		LoadLogo("Flag_of_the_Hungarian_Communist_Party","Flag of the Hungarian Communist Party")
		LoadLogo("Flag_of_Union_State_Space_Agency","Flag of Union State Space Agency")
		LoadLogo("Hammer_and_Sickle_Red","Hammer and Sickle Red")
		LoadLogo("Interkosmos_Cuban_Stamp","Interkosmos Cuban Stamp")
		LoadLogo("Interkosmos_Emblem","Interkosmos Emblem")
		LoadLogo("Interkosmos_Emblem_1977","Interkosmos Emblem 1977")
		LoadLogo("Interkosmos_Emblem_1980","Interkosmos Emblem 1980")
		LoadLogo("Interkosmos_Emblem2","Interkosmos Emblem2")
		LoadLogo("Interkosmos_Emblem3","Interkosmos Emblem3")
		LoadLogo("Interkosmos_Patch_1980","Interkosmos Patch 1980")
		LoadLogo("Interkosmos_Soyuz-31","Interkosmos Soyuz-31")
		LoadLogo("Jordanian_Communist_Party","Jordanian Communist Party")
		LoadLogo("Lebanese_Communist_Party","Lebanese Communist Party")
		LoadLogo("Mexican_Communist_Party","Mexican Communist Party")
		LoadLogo("New_Communist_Party_of_Britain","New Communist Party of Britain")
		LoadLogo("Orden_Pobeda_Marshal_Vasilevsky","Orden Pobeda Marshal Vasilevsky")
		LoadLogo("Party_of_Italian_Communists","Party of Italian Communists")
		LoadLogo("Party_of_Mexican_Communists","Party of Mexican Communists")
		LoadLogo("Peoples_Party_of_Panama","People's Party of Panama")
		LoadLogo("Pioneers_Pin","Pioneers Pin")
		LoadLogo("Portuguese_Communist_Party","Portuguese Communist Party")
		LoadLogo("Progressive_Party_of_Working_People_(Cyprus)","Progressive Party of Working People (Cyprus)")
		LoadLogo("Red_Pride_Galaxywide","Red Pride Galaxywide")
		LoadLogo("Redneck_Commies","Redneck Commies")
		LoadLogo("Russian_Soviet_Federative_Socialist_Republic","Russian Soviet Federative Socialist Republic")
		LoadLogo("South_African_Communist_Party","South African Communist Party")
		LoadLogo("Space_Race","Space Race")
		LoadLogo("Star_Golden_Border","Star Golden Border")
		LoadLogo("Starry_Plough_flag_(1914)","Starry Plough flag (1914)")
		LoadLogo("Swiss_Party_of_Labour","Swiss Party of Labour")
		LoadLogo("Taiwan_Communist_Party","Taiwan Communist Party")
		LoadLogo("The_Spectre_of_Communism","The Spectre of Communism")
		LoadLogo("United_Socialist_States_of_America","United Socialist States of America")
		LoadLogo("USSR","USSR")
		LoadLogo("Workers_of_the_World_Unite","Workers of the World Unite")
		LoadLogo("Workers_Party_of_New_Zealand","Workers Party of New Zealand")
		LoadLogo("Zapatismo_Subcommandante_Marcos","Zapatismo Subcommandante Marcos")
	end
end -- Postprocess
