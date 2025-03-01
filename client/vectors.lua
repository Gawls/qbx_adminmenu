function CopyToClipboard(dataType)
    local coords = GetEntityCoords(cache.ped)
    local x, y, z = math.round(coords.x, 2), math.round(coords.y, 2), math.round(coords.z, 2)
    local heading = GetEntityHeading(cache.ped)
    local h = math.round(heading, 2)

    local data
    local message

    if dataType == 'coords2' then
        data = string.format('vec2(%s, %s)', x, y)
        message = Lang:t('success.coords_copied')
    elseif dataType == 'coords3' then
        data = string.format('vec3(%s, %s, %s)', x, y, z)
        message = Lang:t('success.coords_copied')
    elseif dataType == 'coords4' then
        data = string.format('vec4(%s, %s, %s, %s)', x, y, z, h)
        message = Lang:t('success.coords_copied')
    elseif dataType == 'heading' then
        data = tostring(h)
        message = Lang:t('success.heading_copied')
    end

    lib.setClipboard(data)
    exports.qbx_core:Notify(message, 'success')
end

RegisterNetEvent('qbx_admin:client:copyToClipboard', function(dataType)
    CopyToClipboard(dataType)
end)
