require Logger
defmodule P2Testing.CompileInstr do
  def compile do
    ["defmodule P2Testing.Disasm2 do\n",
     "  def disasmInstr(funct, addr, <<0b00000000000000000000000000000000::size(32)>>), do: funct.(%{addr: addr,con: 0, instr: \"NOP\", binary: <<0::size(32)>>})\n",
      compile("instructions_only.txt"),
     "end\n"]
  end

  def compile! do
    data = compile
    File.write!("lib/p2testing/disasm2.ex", data)
  end

  def compile(filename) do
    File.stream!(filename)
    |> Enum.map(&matchline/1)
    |> Enum.reject(&(&1 == :ok))
    |> Enum.join("\n")

  end

  def matchline(<< "\n" >> ), do: :ok
  def matchline(regexme) do
    [a,b,c,d,e,f,g,h] = Regex.run(~r/^EEEE (.......) (...) (.........) (.........)\s+([^ ]+)\s+([^ ]*)\s*([^ ]*)/, regexme) 
    "#                                           #{String.trim(a)}\n#{matchmatch("#{b}#{c}#{d}#{e}",f,g,h)}"
  end

  def matchmatch(text,f,g,h) do
    [_,instr,rest] = Regex.run(~r/^([01]+)(.+)$/, text)
    "  def disasmInstr(funct, addr, fullbin = <<con::size(4), 0b#{instr}::size(#{String.length(instr)}) #{dd(rest)}>>), do: funct.(%{addr: addr,con: con, instr: \"#{f}\", vars: {#{dvars(rest)}}, fullbin: fullbin})\n"
  end

  def d(text) when is_binary(text) do
    text
    |> String.to_charlist
    |> d([{'', 0}])
  end

  def dvars(rest) do
    d(rest)
    |> String.split(",")
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(fn(t) ->
      case Regex.match?(~r/^0b/, t) do
        true -> "<< #{t} >>"
        false -> Regex.replace(~r/::size\(\d+\)/, t, "\\1")
      end
    end)
    |> Enum.join(",")





    #    Regex.replace(~r/([^01b]+)::size\(\d+\)/, d(rest), "\\1")
  end




  def dd(rest) do
    ",#{d(rest)}"
  end


  def d([h|t], results = [{lastseenchar, count}|tt]) when h == lastseenchar do
    d(t, [{lastseenchar, count+1} | tt])
  end


  def d([h|t], results = results=[{lastseenchar, count}|tt]) do
    d(t, [{h, 1} | results])
  end

    
  def d([], results) do
    results
    |> Enum.reject(&(&1 == {[], 0}))
    |> Enum.reduce([[]], 
       fn({codepoint, count}, acc=[hh|rst]) -> 
         cp = 
          case {codepoint, hh}  do
            {48,_} -> bb = Range.new(1,count)
                    |> Enum.reduce([], fn(_,acc) -> [codepoint|acc] end)
                    '0b' ++ bb
            {49,_} -> bb = Range.new(1,count)
                    |> Enum.reduce([], fn(_,acc) -> [codepoint|acc] end)
                    '0b' ++ bb
            {cp,_} -> cp
       end
       lcchar = [cp]
                |> to_string
                |> String.downcase
                size = to_string(count)
              ["#{lcchar}::size(#{count}),"|acc]
    end)
    |> Enum.join("")
  end









  #  def dispatchfields("CZIDDDDDDDDDSSSSSSSSS"), do: "c::size(1), z::size(1), i::size(1), d::size(9), s::size(9)>>"
  #  def dispatchfields("NNNIDDDDDDDDDSSSSSSSSS"), do: "n::size(3), i::size(1), d::size(9), s::size(9)>>"
  #def dispatchfields("NNIDDDDDDDDDSSSSSSSSS"), do: "n::size(2), i::size(1), d::size(9), s::size(9)>>"
  #def dispatchfields("NIDDDDDDDDDSSSSSSSSS"), do: "n::size(1), i::size(1), d::size(9), s::size(9)>>"
  #def dispatchfields("IDDDDDDDDDSSSSSSSSS"), do: "i::size(1), d::size(9), s::size(9)>>"
  #def dispatchfields("ZIDDDDDDDDDSSSSSSSSS"), do: "z::size(1), i::size(1), d::size(9), s::size(9)>>"
  #def dispatchfields("C0IDDDDDDDDDSSSSSSSSS"), do: "c::size(1). 0b0::size(1), i::size(1), d::size(9), s::size(9)>>"
  #def dispatchfields("C1IDDDDDDDDDSSSSSSSSS"), do: "c::size(1). 0b1::size(1), i::size(1), d::size(9), s::size(9)>>"
  #def dispatchfields("LIDDDDDDDDDSSSSSSSSS"), do: "l::size(1). i::size(1), d::size(9), s::size(9)>>"
  ##def dispatchfields("I000000000SSSSSSSSS"), do: "i::size(1), 0b000000000::size(9), s::size(9)>>"
  #  def dispatchfields("NNNNNNNNNNNNNNNNNNNNNNN"), do: nil
  #def dispatchfields("WWRAAAAAAAAAAAAAAAAAAAA"), do: nil
  #def dispatchfields("RAAAAAAAAAAAAAAAAAAAA"), do: nil
  #def dispatchfields("CZ10cccczzzz001101111"), do: nil
  #def dispatchfields("DDDDDDDDD001101100"), do: nil
  #def dispatchfields("CZ0DDDDDDDDD001101010"), do: nil
  #def dispatchfields(txt), do: IO.inspect(txt)




  #def matchmatch([wholeline, instrbin, "CZI", "DDDDDDDDD", "SSSSSSSSS", instr, arg0, arg1]) do # normal
  #  def matchmatch([wholeline, instrbin, "CZI", "DDDDDDDDD", "SSSSSSSSS", instr, arg0, arg1]) do # normal
  #  IO.puts("  def decodeInstr(<<def disasm_instr(addr, <<   cnd::size(4), 0b#{instrbin}::size(7), c::size(1), z::size(1), i::size(1), d::size(9), s::size(9)>>), do :ok")
  #end
  #  def matchmatch([wholeline, instrbin, czi, dest, source, instr, arg0, arg1]) do # extended
  #  Logger.debug(inspect(wholeline))
  #end



  def matchline(line) do
    Logger.debug(inspect(line))
  end


end
