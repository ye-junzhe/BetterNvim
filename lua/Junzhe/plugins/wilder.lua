local status, wilder = pcall(require, "wilder")
if not status then
	return
end

wilder.setup({ modes = { ":", "/", "?" } })
