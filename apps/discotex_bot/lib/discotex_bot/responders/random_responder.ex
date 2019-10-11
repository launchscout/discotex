defmodule DiscotexBot.Responders.RandomResponder do
  @moduledoc """
  A module to handle random list choice regex call/response interactions
  """

  # remove Discord Struct references
  alias Nostrum.Struct.Message

  @message_types [
    {~r/\badventure me\b/i, :adventure_me},
    {~r/\bcatbug me\b/i, :catbug_me},
    {~r/\benlighten me\b/i, :enlighten_me},
    {~r/\bgob it\b/i, :gob_it},
    {~r/\bjackie chan\b/i, :jackie_chan}
  ]

  def responds_to?(message) do
    case map_message(message) do
      {:unknown, _} -> false
      _ -> true
    end
  end

  def handle_message(message) do
    message |> map_message() |> do_reply()
  end

  @adventures [
    "http://i.imgur.com/eaF2r1U.gif",
    "http://media.giphy.com/media/j2rCxv6luaLq8/giphy.gif",
    "http://media.giphy.com/media/3f6yGRBkD6skU/giphy.gif",
    "http://24.media.tumblr.com/0172030308d6960cbb742fc8943d14cb/tumblr_mjsmgnXLv21qhszhwo1_500.gif",
    "http://i.imgur.com/L9wqAyP.gif",
    "http://2.bp.blogspot.com/-F-AkxSioLKg/UdJt7s87cqI/AAAAAAAAQb0/2ro0hpJ73hc/s500/atg7.gif",
    "http://i.imgur.com/ZHZmWan.gif",
    "http://media1.giphy.com/media/X7X9dkC0kZQ9G/giphy.gif",
    "http://67.media.tumblr.com/tumblr_lwb8xelvCt1qd090do1_500.gif",
    "http://27.media.tumblr.com/tumblr_m2r3deR1Hd1qg8t4ro1_500.gif",
    "https://media.giphy.com/media/A441EggWUa7cc/giphy.gif",
    "https://tribzap2it.files.wordpress.com/2014/01/adventuretime-dance.gif?w=392&h=214",
    "http://66.media.tumblr.com/ed03a0ae5447a3c25b290dbed679ba83/tumblr_nqzho285C61s266z3o1_500.gif",
    "http://umalojadecaneca.com.br/wp-content/uploads/2015/11/hora-da-aventura-loucura.gif",
    "https://66.media.tumblr.com/d487b88a796738d986094ea79a655fde/tumblr_np6agoYN7k1qba9rro1_500.gif",
    "https://media.giphy.com/media/daUOBsa1OztxC/giphy.gif",
    "https://media.giphy.com/media/tH2oOpjPuN6I8/giphy.gif",
    "https://67.media.tumblr.com/849daef7a04cce8ccffd037a19ce1b21/tumblr_inline_ob7j5oxzzZ1ro4b45_500.gif",
    "https://img.buzzfeed.com/buzzfeed-static/static/2015-12/1/16/enhanced/webdr08/anigif_enhanced-buzz-18329-1449006465-5.gif",
    "https://67.media.tumblr.com/tumblr_lnddw96pvr1ql201ao1_500.gif"
  ]
  defp do_reply({:adventure_me, message}) do
    {:message_create, Enum.random(@adventures), message.channel_id}
  end

  @catbugs [
    "http://i.imgur.com/eaF2r1U.gif",
    "http://media.giphy.com/media/j2rCxv6luaLq8/giphy.gif",
    "http://media.giphy.com/media/3f6yGRBkD6skU/giphy.gif",
    "http://24.media.tumblr.com/0172030308d6960cbb742fc8943d14cb/tumblr_mjsmgnXLv21qhszhwo1_500.gif",
    "http://thoughtcatalog.files.wordpress.com/2013/05/5.gif?w=500&h=281",
    "https://i.chzbgr.com/maxW500/7935750400/h540D9086/",
    "http://img3.wikia.nocookie.net/__cb20140312153641/bravestwarriors/images/2/21/Catbugcrayons.jpg",
    "http://media.tumblr.com/0181965f4b309ccf40a13d965e03a60f/tumblr_inline_mlrxebXsYg1qz4rgp.gif",
    "http://media3.giphy.com/media/H87TugWWaTzKE/200_s.gif",
    "http://media1.giphy.com/media/oyYeUcIwDOd3O/200_s.gif",
    "http://thoughtcatalog.files.wordpress.com/2013/05/6.gif",
    "http://31.media.tumblr.com/737b29032cbf1f2d798e0558bb1abc5e/tumblr_mh5k4ttOYC1qeg3czo1_500.gif",
    "http://37.media.tumblr.com/38a415b04d1711eac3fcffc382359068/tumblr_mjck4sk85a1r2y7r9o1_r1_500.gif",
    "http://ih1.redbubble.net/image.14382476.6607/fc,550x550,white.u1.jpg",
    "http://img4.wikia.nocookie.net/__cb20140312154115/bravestwarriors/images/d/dd/CatbugStalks.jpg",
    "http://38.media.tumblr.com/d06641c73378cdca5aefad70a6b17d81/tumblr_ms6zs4B62z1s2r9z3o5_r2_400.gif",
    "http://38.media.tumblr.com/227533df6df604fb7edfffe94fa46fb5/tumblr_mrl6lnyF8W1qd4796o1_500.gif",
    "http://38.media.tumblr.com/421f98309b291f3364bc7c2887788c4e/tumblr_mr1gktpvQO1s6x4aoo2_500.gif",
    "http://38.media.tumblr.com/aeffa9663317dfa8e0c5ea690d88181d/tumblr_mr1gktpvQO1s6x4aoo1_500.gif"
  ]
  defp do_reply({:catbug_me, message}) do
    {:message_create, Enum.random(@catbugs), message.channel_id}
  end

  @buddha [
    "Do not dwell in the past, do not dream of the future, concentrate the mind on the present moment.",
    "Thousands of candles can be lighted from a single candle, and the life of the candle will not be shortened. Happiness never decreases by being shared.",
    "Three things cannot be long hidden: the sun, the moon, and the truth.",
    "There are only two mistakes one can make along the road to truth; not going all the way, and not starting.",
    "The mind is everything. What you think you become.",
    "Holding on to anger is like grasping a hot coal with the intent of throwing it at someone else; you are the one who gets burned.",
    "No one saves us but ourselves. No one can and no one may. We ourselves must walk the path.",
    "It is better to travel well than to arrive.",
    "You, yourself, as much as anybody in the entire universe, deserve your love and affection.",
    "Just as treasures are uncovered from the earth, so virtue appears from good deeds, and wisdom appears from a pure and peaceful mind. To walk safely through the maze of human life, one needs the light of wisdom and the guidance of virtue.",
    "You will not be punished for your anger, you will be punished by your anger.",
    "We are shaped by our thoughts; we become what we think. When the mind is pure, joy follows like a shadow that never leaves.",
    "Peace comes from within. Do not seek it without."
  ]
  defp do_reply({:enlighten_me, message}) do
    {:message_create, Enum.random(@buddha), message.channel_id}
  end

  @gobs [
    "http://bite-prod.s3.amazonaws.com/wp-content/uploads/2012/05/chicken-dance-2.gif",
    "http://bite-prod.s3.amazonaws.com/wp-content/uploads/2012/05/Gob.gif",
    "http://bite-prod.s3.amazonaws.com/wp-content/uploads/2012/05/pants.gif",
    "http://bite-prod.s3.amazonaws.com/wp-content/uploads/2012/05/pennies1.gif",
    "http://bite-prod.s3.amazonaws.com/wp-content/uploads/2012/05/queen_reveal.gif",
    "http://bite-prod.s3.amazonaws.com/wp-content/uploads/2012/05/scotch.gif",
    "http://farm1.static.flickr.com/223/511011836_56ae92ec1a_o.gif",
    "http://cdn.nextround.net/wp-content/uploads/2010/03/gob-bluth-gif-6.gif",
    "http://farm1.static.flickr.com/206/510999823_23796e531c_o.gif",
    "http://farm1.static.flickr.com/209/510999843_8243c5d8c2_o.gif",
    "http://farm1.static.flickr.com/200/511028609_77e4eb3619_o.gif",
    "http://farm1.static.flickr.com/224/511001748_881f933034_o.gif",
    "http://farm1.static.flickr.com/209/511032209_4675bf163e_o.gif",
    "http://farm1.static.flickr.com/212/511032213_65f7cd9f12_o.gif",
    "http://25.media.tumblr.com/tumblr_m4rb3j8o9l1qgoi9lo1_500.gif",
    "http://24.media.tumblr.com/tumblr_m3gd8b0Vm71qbhh43o1_500.gif",
    "http://25.media.tumblr.com/tumblr_m0y41dR5Rg1qf0kb5o1_r1_400.gif",
    "http://25.media.tumblr.com/tumblr_m1pl69N19a1qf0kb5o1_400.gif",
    "http://24.media.tumblr.com/tumblr_lyp0cn0ZVh1r69h01o1_r2_250.gif",
    "http://25.media.tumblr.com/tumblr_lyiyhyMJbt1qgoi9lo1_500.gif",
    "http://24.media.tumblr.com/tumblr_lu9m4mCoVB1qk5u7ao1_400.gif",
    "http://25.media.tumblr.com/tumblr_lpabn5sAXF1qldcnvo1_500.gif",
    "http://25.media.tumblr.com/tumblr_lpbjdhqbyF1qa7lwzo1_500.gif",
    "http://25.media.tumblr.com/tumblr_lmq1fewvEi1qb34nxo1_500.gif",
    "http://media.tumblr.com/tumblr_m5hknk8g841qzblt6.gif",
    "http://25.media.tumblr.com/tumblr_lljt1gEqIs1qerndjo1_400.gif",
    "http://24.media.tumblr.com/tumblr_lka9b7SinV1qhivy6o1_500.gif"
  ]
  defp do_reply({:gob_it, message}) do
    {:message_create, Enum.random(@gobs), message.channel_id}
  end

  @jackie_chans [
    "https://media.giphy.com/media/9pklZGUcreyfm/giphy.gif",
    "https://media.giphy.com/media/h3e8Hr4bBndS0/giphy.gif",
    "https://media.giphy.com/media/5xtDarKaxbNRjKhGe2c/giphy.gif",
    "https://media.giphy.com/media/YGXr4RYSF0FW/giphy.gif",
    "https://media.giphy.com/media/3o7abtRKyllr9iQZ1K/giphy.gif",
    "https://media.giphy.com/media/10W7YOp7PaMVxu/giphy.gif",
    "https://media.giphy.com/media/xT9DPLBZEnek4zvEQg/giphy.gif",
    "https://media.giphy.com/media/xT9DPjOy0lxRvRGNXi/giphy.gif",
    "https://media.giphy.com/media/9jKPtWhufybHa/giphy.gif"
  ]
  defp do_reply({:jackie_chan, message}) do
    {:message_create, Enum.random(@jackie_chans), message.channel_id}
  end

  defp map_message(message = %Message{content: content}) do
    {_, type} =
      Enum.find(@message_types, {nil, :unknown}, fn {reg, _type} ->
        String.match?(content, reg)
      end)

    {type, message}
  end
end
