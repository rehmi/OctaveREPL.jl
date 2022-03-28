module OctaveREPL

export octave

# define necessary environment variables before PyCall initialization
# ENV["OCTAVE"] = "/opt/homebrew/bin/octave"

# using PythonCall
using PyCall

export @oct_str
export octave_reader

# parse_apl, eval_apl, init_repl

# include("parser.jl")
# include("eval.jl")
# include("show.jl")

# export init_repl, octave_reader
# include("start_octave.jl")
# include("repl.jl")

macro oct_str(str)
	try
		str |> octave.eval #|> esc
	catch err
		println(err.val.args...)
		err
	end
end

using ReplMaker

const oct2py = PyNULL()
const octave = PyNULL()

function octave_reader(str)
	try
		str |> octave.eval
	catch err
		println(err.val.args...)
		nothing
	end
end

function init_octave_repl(; prompt_text="octave> ", prompt_color=:cyan, start_key=",", sticky=true)
	ReplMaker.initrepl(octave_reader,
				repl=Base.active_repl,
				prompt_text=prompt_text, prompt_color=prompt_color,
				start_key=start_key, sticky_mode=sticky,
				mode_name="Octave mode")
end

	function __init__()
	# define necessary environment variables before PyCall initialization
	os = pyimport("os")

	# os.environ["OCTAVE"] = "/opt/homebrew/bin/octave"
	# os.environ["OCTAVE_EXECUTABLE"] = "/opt/homebrew/bin/octave"

	py"""
	import os
	os.environ["OCTAVE"] = "/opt/homebrew/bin/octave"
	os.environ["OCTAVE_EXECUTABLE"] = "/opt/homebrew/bin/octave"
	"""

	# PyCall.__init__()

	# set up octave instance
	copy!(oct2py, pyimport_conda("oct2py", "oct2py"))
	copy!(octave, oct2py.octave)
	# octave.addpath(pwd())
	# @info octave.whos()


	isdefined(Base, :active_repl) ? init_octave_repl() : nothing
end


end
