-- Minimal pub/sub used to notify UI of controller state changes.

local Signal = {}
Signal.__index = Signal

function Signal.new()
	return setmetatable({ _listeners = {} }, Signal)
end

function Signal:Connect(callback)
	table.insert(self._listeners, callback)
	local connection = {}
	function connection.Disconnect()
		local index = table.find(self._listeners, callback)
		if index then
			table.remove(self._listeners, index)
		end
	end
	return connection
end

function Signal:Fire(...)
	for _, callback in ipairs(self._listeners) do
		callback(...)
	end
end

return Signal
