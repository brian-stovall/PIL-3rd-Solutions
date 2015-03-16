local function name2node (graph, name)
	local node = graph[name]
	if not node then
		node = {name = name, arc = {}}
		graph[name] = node
	end
		return node
end

function readgraph (file)
	local graph = {}
	for line in io.lines(file or nil)do
		local namefrom, nameto, label = string.match(line, "(%S+)%s+(%S+)%s+(%d+)")
		local from = name2node(graph, namefrom)
		local to = name2node(graph, nameto)
		from.arc[to] = tonumber(label)
	end
	return graph
end

function getArcs(node)
		for to, dist in pairs(node.arc) do
			coroutine.yield( to, dist )
		end
end

function arcs(node)
	return coroutine.wrap(function() getArcs(node) end)
end

function dSearch(graph, start, fin)
	local distab = {}
	for k, _ in pairs(graph) do
		distab[graph[k]] = math.huge
	end
	
	distab[start] = 0 --set the starting node's distance to 0

  local fixedNodes = {}
	table.insert(fixedNodes, start)

	while distab[fin] == math.huge do
		local lowest = {node = nil, dist = math.huge, from = nil}
		for _, fromNode in ipairs(fixedNodes) do
			for to, dist in arcs(fromNode) do
				if (dist + distab[fromNode]) < lowest.dist and distab[to] == math.huge then 
					lowest.dist = dist + distab[fromNode]
					lowest.node = to
					lowest.from = fromNode
				end
			end
		end
		distab[lowest.node] = lowest.dist
		table.insert(fixedNodes, lowest.node)
		
	end
	return distab[fin]
end

graph = readgraph('graph.txt')

print('the shortest distance is: ', dSearch(graph, graph.o, graph.e))
