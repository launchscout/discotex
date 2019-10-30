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
    {~r/\bjackie chan\b/i, :jackie_chan},
    {~r/\bkitten me\b/i, :kitten_me},
    {~r/\bpizza me\b/i, :pizza_me},
    {~r/\bship it\b/i, :ship_it},
    {~r/\btable flip\b/i, :table_flip},
    {~r/\bvalidate me\b/i, :validate_me},
    {~r/\bsummon gir\b/i, :gir_me}
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

  @kittens [
    "http://33.media.tumblr.com/238f42b125fe2dc26990588784580b43/tumblr_n2ukm980jV1tw5bhko1_500.gif",
    "http://38.media.tumblr.com/tumblr_mdp11xqyi71qbc3qpo2_500.gif",
    "http://24.media.tumblr.com/tumblr_liqd1bRSDi1qzjlrro1_500.gif",
    "http://i.kinja-img.com/gawker-media/image/upload/s--KePUFUup--/706042605651277092.gif",
    "http://3.bp.blogspot.com/-tVR9IESFn54/UV2BKYehVAI/AAAAAAAAHTM/8dM0CFuPnms/s1600/funny+Kitten+jump+fail.jpg",
    "http://gifrific.com/wp-content/uploads/2013/11/Cat-Jump-to-Bookshelf-Jump-Fail.gif",
    "http://24.media.tumblr.com/tumblr_mbz08hLeuF1ryaiojo1_400.gif",
    "http://meowgifs.com/wp-content/uploads/2013/02/cute-mom-bops-kitten.gif",
    "http://i1082.photobucket.com/albums/j370/Jezey/Fail%20Funny%20Gifs/Kitten-jump-fail.gif",
    "http://chan.catiewayne.com/m/src/134562472131.gif",
    "http://i.imgur.com/wfbtjPj.gif",
    "http://i40.tinypic.com/15etkpg.jpg"
  ]
  defp do_reply({:kitten_me, message}) do
    {:message_create, Enum.random(@kittens), message.channel_id}
  end

  @pizzas [
    "http://31.media.tumblr.com/tumblr_m65009uKEj1qg1qbpo1_500.gif",
    "http://38.media.tumblr.com/tumblr_m43dvaDa2q1qav3uso1_400.gif",
    "http://38.media.tumblr.com/tumblr_ly04bu58um1qc3geoo1_500.gif",
    "http://37.media.tumblr.com/tumblr_lv32ciI4eZ1r5qrimo1_500.gif",
    "http://37.media.tumblr.com/tumblr_lvenci6G4p1qgqvcco1_400.gif",
    "http://31.media.tumblr.com/tumblr_mbhe2rPXhV1rcwwuko1_500.gif",
    "http://38.media.tumblr.com/tumblr_memu7iPW5g1qze55oo1_500.gif",
    "http://38.media.tumblr.com/f34be0aaf9b920568fba73963785fc87/tumblr_meqrswKFay1qzgjfco1_500.gif",
    "http://37.media.tumblr.com/tumblr_m8z92d8YhH1qet1tyo1_400.gif",
    "http://31.media.tumblr.com/tumblr_m7a4hwe4O91qaurswo1_500.gif",
    "http://31.media.tumblr.com/tumblr_lul5nbZTIq1qcj0ioo1_500.gif",
    "http://33.media.tumblr.com/tumblr_lq3rfmpaTQ1r0h9qio1_500.gif",
    "http://31.media.tumblr.com/tumblr_lrb5p6O29T1qmaa05o1_500.gif",
    "http://38.media.tumblr.com/tumblr_lqluuqXeeg1qaplgeo1_500.gif",
    "http://38.media.tumblr.com/tumblr_lptk9kVoJM1ql4treo1_500.gif",
    "http://38.media.tumblr.com/tumblr_lp4b8eGqJ31qjb3mno1_500.gif",
    "http://38.media.tumblr.com/tumblr_lk16eujtJk1qg39ewo1_500.gif",
    "http://38.media.tumblr.com/tumblr_ln0hkq0jOg1qiftoro1_500.gif",
    "http://37.media.tumblr.com/tumblr_lnvnkiNgjQ1qzgjfco1_500.gif",
    "http://38.media.tumblr.com/tumblr_luhk9lwVvb1r0ix14o1_500.gif",
    "http://38.media.tumblr.com/tumblr_ltaje3Atoi1qgwqw9o1_500.gif",
    "http://33.media.tumblr.com/tumblr_lu5g1jW8wv1qb9pa3o1_500.gif",
    "http://38.media.tumblr.com/tumblr_lu7i9azRY21r0ix14o1_500.gif",
    "http://38.media.tumblr.com/tumblr_lu9u2ki0UZ1r0ix14o1_500.gif",
    "http://37.media.tumblr.com/tumblr_ljni10ksoA1qcnihto1_500.gif",
    "http://31.media.tumblr.com/tumblr_lrkto47Trh1qzgjfco1_500.gif",
    "http://37.media.tumblr.com/tumblr_lmi3wtiR3c1qaphrco1_500.gif",
    "http://31.media.tumblr.com/tumblr_ln1d0ywWsO1qffwtqo1_500.gif",
    "http://38.media.tumblr.com/tumblr_llu12gawjY1qgbvzco1_500.gif",
    "http://38.media.tumblr.com/tumblr_lkq9nb5DEN1qgbvzco1_500.gif",
    "http://37.media.tumblr.com/tumblr_ll3hynoiS11qj0e5wo1_500.gif",
    "http://37.media.tumblr.com/tumblr_ln06xkpcUH1qdx3jjo1_500.gif",
    "http://38.media.tumblr.com/tumblr_ln3tfl1SJ61qdh05go1_500.gif",
    "http://31.media.tumblr.com/tumblr_lmt3j3mqjq1qffwtqo1_500.gif",
    "http://31.media.tumblr.com/tumblr_lmlfqfMtTj1qb0zzwo1_500.gif",
    "http://38.media.tumblr.com/tumblr_lmlu93F4uy1qbqh0ao1_500.gif",
    "http://38.media.tumblr.com/tumblr_llxxy2spSu1qhy6c9o1_400.gif",
    "http://38.media.tumblr.com/tumblr_llelwcsvuw1qcfupdo1_400.gif",
    "http://38.media.tumblr.com/tumblr_lldrtn48oR1qbcswco1_500.gif",
    "http://37.media.tumblr.com/tumblr_llafsb3Lhn1qeszvio1_500.gif",
    "http://38.media.tumblr.com/tumblr_llbclffFeK1qzgjfco1_500.gif",
    "http://38.media.tumblr.com/tumblr_ljkw3h43lT1qckkzso1_500.gif",
    "http://38.media.tumblr.com/tumblr_llzj4q1A0H1qgbvzco1_500.gif",
    "http://31.media.tumblr.com/tumblr_lm3h8tHTTb1qzekdio1_500.gif",
    "http://37.media.tumblr.com/tumblr_llnqbvqS2P1qfjpmro1_500.gif",
    "http://37.media.tumblr.com/tumblr_laf65f89nV1qzan0uo1_r1_500.gif",
    "http://38.media.tumblr.com/tumblr_lk16eujtJk1qg39ewo1_500.gif",
    "http://38.media.tumblr.com/tumblr_lk1bjm51tT1qaq31ro1_400.gif",
    "http://38.media.tumblr.com/tumblr_lkpt3ycJR51qj0e5wo1_500.gif",
    "http://37.media.tumblr.com/tumblr_lkuik3MhQg1qcr7fqo1_500.gif",
    "http://38.media.tumblr.com/tumblr_ljrvr4LvvU1qcvp5do1_500.gif",
    "http://38.media.tumblr.com/tumblr_lkp1jpAgKS1qa48wxo1_500.gif",
    "http://38.media.tumblr.com/tumblr_lktkjfUM601qccbm7o1_500.gif",
    "http://31.media.tumblr.com/tumblr_ljc6d3dERQ1qij0xno1_500.gif",
    "http://33.media.tumblr.com/tumblr_lk4e9o218m1qb7icgo1_500.gif",
    "http://31.media.tumblr.com/tumblr_lixvosPRtA1qa6nhao1_250.gif",
    "http://31.media.tumblr.com/tumblr_lhlg20BQlC1qz9dw1o1_500.gif",
    "http://38.media.tumblr.com/tumblr_ljkcgotG9y1qiz6lzo1_500.gif",
    "http://31.media.tumblr.com/tumblr_ljisfgCV9o1qadi39o1_500.gif",
    "http://38.media.tumblr.com/tumblr_lipviwtDfO1qe8zzxo1_500.gif",
    "http://38.media.tumblr.com/tumblr_lj28p38NlG1qcp5rio1_500.gif",
    "http://31.media.tumblr.com/tumblr_liwr204bNG1qzp9weo1_500.gif",
    "http://38.media.tumblr.com/tumblr_liqtup77191qa48wxo1_500.gif",
    "http://38.media.tumblr.com/tumblr_lhcys03C0y1qgmrwlo1_500.gif",
    "http://31.media.tumblr.com/tumblr_lip0j0tdxe1qeg9feo1_400.gif",
    "http://38.media.tumblr.com/tumblr_lifkngBvse1qdavqgo1_400.gif",
    "http://37.media.tumblr.com/tumblr_libdsgAUY21qcr7fqo1_500.gif",
    "http://33.media.tumblr.com/tumblr_lhrujmLI2Q1qzssaso1_250.gif",
    "http://31.media.tumblr.com/tumblr_lfw91hVUR41qghbeyo1_500.gif",
    "http://37.media.tumblr.com/tumblr_lh4uc41FuW1qzprgho1_500.gif",
    "http://37.media.tumblr.com/tumblr_lhyxb7gU3I1qa5ylbo1_500.gif",
    "http://31.media.tumblr.com/tumblr_li0jkk4U1h1qfd42qo1_250.gif",
    "http://38.media.tumblr.com/tumblr_lgzyxyfk5S1qcr7fqo1_500.gif",
    "http://37.media.tumblr.com/tumblr_lh9mbtcTiy1qflpc1o1_500.gif",
    "http://37.media.tumblr.com/tumblr_lgcgnjHRKg1qgevvso1_500.gif",
    "http://38.media.tumblr.com/tumblr_lgc6sonEz41qedj0to1_500.gif",
    "http://38.media.tumblr.com/tumblr_lh7mpeHA1t1qdf7a3o1_500.gif",
    "http://37.media.tumblr.com/tumblr_lh7pefY1M51qziv10o1_500.gif",
    "http://38.media.tumblr.com/tumblr_lgbsytxWpM1qdg89zo1_400.gif",
    "http://33.media.tumblr.com/tumblr_lgjdtfZ2151qcfn05o1_400.gif",
    "http://38.media.tumblr.com/tumblr_lgfp58vaTp1qc0w4do1_500.gif",
    "http://38.media.tumblr.com/tumblr_lgliafCp3U1qbr6opo1_500.gif",
    "http://38.media.tumblr.com/tumblr_lfsyaoTlNQ1qenu42o1_500.gif",
    "http://38.media.tumblr.com/tumblr_lg4e8xxKji1qc77jio1_500.gif",
    "http://38.media.tumblr.com/tumblr_lgh2tzOKFb1qajezpo1_500.gif",
    "http://38.media.tumblr.com/tumblr_lggl293Sml1qgj5j7o1_400.gif",
    "http://38.media.tumblr.com/tumblr_lgy4z8JsQZ1qc1z2lo1_500.gif",
    "http://38.media.tumblr.com/tumblr_les8e6XsVf1qa1xnko1_500.gif",
    "http://33.media.tumblr.com/tumblr_lgw061O7f21qeg9feo1_500.gif",
    "http://31.media.tumblr.com/tumblr_lguqb0fluO1qeg9feo1_500.gif",
    "http://31.media.tumblr.com/tumblr_lguq8sAlPo1qeg9feo1_100.gif",
    "http://38.media.tumblr.com/tumblr_lguq4wx2qD1qeg9feo1_100.gif",
    "http://33.media.tumblr.com/tumblr_lgtxjwaeul1qc9z2jo1_500.gif",
    "http://38.media.tumblr.com/tumblr_lfsx6d6K7s1qfbsj1o1_500.gif",
    "http://33.media.tumblr.com/tumblr_lgc6fxkDwJ1qbvl2io1_500.gif",
    "http://33.media.tumblr.com/tumblr_lg5wtc2mG61qed9k1o1_500.gif",
    "http://31.media.tumblr.com/tumblr_lfzzc9vAA81qgj5j7o1_400.gif",
    "http://38.media.tumblr.com/tumblr_lg14x4afkD1qbzx9do1_400.gif",
    "http://38.media.tumblr.com/tumblr_lg0zz1iFJO1qb53jco1_500.gif",
    "http://37.media.tumblr.com/tumblr_leksieCNIx1qaphrco1_500.gif",
    "http://31.media.tumblr.com/tumblr_lfwe7m31fj1qaezmeo1_500.gif",
    "http://31.media.tumblr.com/tumblr_lfxi13EwtQ1qbf487o1_500.gif",
    "http://38.media.tumblr.com/tumblr_lf6dc1ICj51qbvl2io1_400.gif",
    "http://38.media.tumblr.com/tumblr_lfitclPEea1qasjb4o1_250.gif",
    "http://37.media.tumblr.com/tumblr_lfgi7n0sKZ1qzs84bo1_r4_400.gif",
    "http://31.media.tumblr.com/tumblr_lfhxdbgzKK1qdaaw6o1_500.gif",
    "http://31.media.tumblr.com/tumblr_l9u7asFeL21qdaaw6o1_400.gif",
    "http://33.media.tumblr.com/tumblr_lbfse1WjZ31qzdf0go1_500.gif",
    "http://31.media.tumblr.com/tumblr_lddrb70iej1qev5igo1_500.gif",
    "http://31.media.tumblr.com/tumblr_ledjr3mYbG1qev5igo1_500.gif",
    "http://31.media.tumblr.com/tumblr_leqj570WYJ1qfm9xho1_400.gif",
    "http://37.media.tumblr.com/tumblr_leavsrjn1n1qffwtqo1_500.gif",
    "http://37.media.tumblr.com/tumblr_lefgh2P5V91qbhy77o1_500.gif",
    "http://38.media.tumblr.com/tumblr_le69q3XdIF1qev5igo1_400.gif",
    "http://33.media.tumblr.com/tumblr_le3vmgGhGF1qaphrco1_400.gif",
    "http://37.media.tumblr.com/tumblr_ldrnppvKzL1qcv1oqo1_500.gif",
    "http://31.media.tumblr.com/tumblr_le5giehvMl1qe8kuno1_400.gif",
    "http://33.media.tumblr.com/tumblr_ldtvgxQxHu1qbbkqoo1_500.gif",
    "http://37.media.tumblr.com/tumblr_ldpbqlz4pb1qfccvpo1_500.gif",
    "http://37.media.tumblr.com/tumblr_lf2vg2krL81qck858o1_500.gif",
    "http://31.media.tumblr.com/tumblr_lfhued3Ppe1qdaaw6o1_500.gif",
    "http://33.media.tumblr.com/tumblr_lclis868Rd1qdk2oko1_500.gif",
    "http://38.media.tumblr.com/tumblr_lfbrp5z4O51qzxb5zo1_500.gif",
    "http://38.media.tumblr.com/tumblr_lf5dxm3eNv1qev5igo1_r1_500.gif",
    "http://38.media.tumblr.com/tumblr_ley9hazTcW1qzpy7ko1_500.gif",
    "http://37.media.tumblr.com/tumblr_lez1xrik9I1qbvl2io1_400.gif",
    "http://33.media.tumblr.com/tumblr_le26f7Fxp71qb0xeuo1_500.gif",
    "http://37.media.tumblr.com/tumblr_levn5fX2Jj1qbvl2io1_400.gif",
    "http://33.media.tumblr.com/tumblr_leqwz8h8yq1qziwcjo1_500.gif",
    "http://31.media.tumblr.com/tumblr_lbkqv81UMN1qaphrco1_500.gif",
    "http://38.media.tumblr.com/tumblr_lem724DOzs1qaphrco1_500.gif",
    "http://38.media.tumblr.com/tumblr_lepmakZW971qb3i2zo1_500.gif",
    "http://38.media.tumblr.com/tumblr_lejguaU4zt1qdy1k6o1_400.gif",
    "http://38.media.tumblr.com/tumblr_lekj1nn4oq1qzjmmgo1_400.gif",
    "http://37.media.tumblr.com/tumblr_lbyfj3HBGV1qa48wxo1_500.gif",
    "http://33.media.tumblr.com/tumblr_led4ysHHrD1qej6xfo1_500.gif",
    "http://38.media.tumblr.com/tumblr_leabvlmiQC1qzdf0go1_400.gif",
    "http://37.media.tumblr.com/tumblr_ldpayzygQR1qfccvpo1_500.gif",
    "http://37.media.tumblr.com/tumblr_ldnb3z7dBf1qerlqeo1_500.gif",
    "http://38.media.tumblr.com/tumblr_ldw5z0U4eF1qzwvwno1_500.gif",
    "http://38.media.tumblr.com/tumblr_ldue7dabdF1qb53jco1_500.gif",
    "http://37.media.tumblr.com/tumblr_ldi6footm81qbta6ao1_400.gif",
    "http://31.media.tumblr.com/tumblr_ldlzp1Pzuc1qzobxio1_500.gif",
    "http://38.media.tumblr.com/tumblr_ldjql82W7d1qakdmuo1_250.gif",
    "http://38.media.tumblr.com/tumblr_lavm7mZ1gu1qa48wxo1_500.gif",
    "http://33.media.tumblr.com/tumblr_ldhk29tCaa1qzfhtro1_500.gif",
    "http://38.media.tumblr.com/tumblr_lcauvzy9Tc1qdezf9o1_400.gif",
    "http://31.media.tumblr.com/tumblr_lda4tjWiOc1qeg9feo1_500.gif",
    "http://38.media.tumblr.com/tumblr_lcxvtfV3Et1qbcvf9o1_500.gif",
    "http://37.media.tumblr.com/tumblr_l8g3629DVT1qbxb9xo1_400.gif",
    "http://31.media.tumblr.com/tumblr_l9u2e8k0Gk1qdaaw6o1_400.gif",
    "http://38.media.tumblr.com/tumblr_l9xf0ivMUx1qdk2oko1_500.gif",
    "http://31.media.tumblr.com/tumblr_l9z8pafhq21qcr7fqo1_400.gif",
    "http://38.media.tumblr.com/tumblr_lcd9oaNycm1qaphrco1_500.gif",
    "http://33.media.tumblr.com/tumblr_lckvvvir1H1qeg9feo1_500.gif",
    "http://31.media.tumblr.com/tumblr_ld31ujOt3O1qb53jco1_500.gif",
    "http://38.media.tumblr.com/tumblr_ld8fjkoUqR1qaezmeo1_500.gif",
    "http://33.media.tumblr.com/tumblr_lbvsiexZcW1qcr7fqo1_r1_500.gif",
    "http://38.media.tumblr.com/tumblr_lcs77cgbFM1qcr7fqo1_500.gif",
    "http://37.media.tumblr.com/tumblr_lcpmlocuKS1qd5xp5o1_500.gif",
    "http://38.media.tumblr.com/tumblr_lc9pxxFCOt1qdoghio1_400.gif",
    "http://33.media.tumblr.com/tumblr_lckrbsPRQq1qb9qwwo1_500.gif",
    "http://31.media.tumblr.com/tumblr_lciaghJLkW1qaezmeo1_500.gif",
    "http://31.media.tumblr.com/tumblr_lakzzlq74p1qzgjfco1_500.gif",
    "http://38.media.tumblr.com/tumblr_lbkequ1UfB1qa4f9io1_500.gif",
    "http://31.media.tumblr.com/tumblr_lbeba6cS5u1qdk2oko1_500.gif",
    "http://37.media.tumblr.com/tumblr_lc3vrtbwwy1qzgjfco1_400.gif",
    "http://31.media.tumblr.com/tumblr_lc82f9chwj1qzdf0go1_500.gif",
    "http://37.media.tumblr.com/tumblr_lc9m3rWsqc1qcr7fqo1_500.gif",
    "http://37.media.tumblr.com/tumblr_lcb821y7fg1qbel32o1_400.gif",
    "http://38.media.tumblr.com/tumblr_lazazw2kuI1qcr7fqo1_400.gif",
    "http://33.media.tumblr.com/tumblr_lb8blwF5tk1qaphrco1_400.gif",
    "http://37.media.tumblr.com/tumblr_lb8yeiudcm1qa68j2o1_400.gif",
    "http://38.media.tumblr.com/tumblr_lbcble7n3K1qa48wxo1_500.gif",
    "http://33.media.tumblr.com/tumblr_md6v7wxRUS1rin469o1_500.gif",
    "http://31.media.tumblr.com/4e3dc930c4d395306f79b43189f7ba72/tumblr_mm6ixbWd551qb8uexo1_500.gif",
    "http://31.media.tumblr.com/798b4137d15d48f19a250fe94a69ef62/tumblr_mgyfs028Oj1qlv134o1_500.gif",
    "http://37.media.tumblr.com/4f1e82c97ac27944891a205e45afc74f/tumblr_mhisx8QMAI1qkq6gjo1_500.gif",
    "http://38.media.tumblr.com/tumblr_m5f7td0RmC1rnov8io1_500.gif"
  ]
  defp do_reply({:pizza_me, message}) do
    {:message_create, Enum.random(@pizzas), message.channel_id}
  end

  @squirrels [
    "http://shipitsquirrel.github.io/images/ship%20it%20squirrel.png",
    "http://28.media.tumblr.com/tumblr_lybw63nzPp1r5bvcto1_500.jpg",
    "http://i.imgur.com/DPVM1.png",
    "http://d2f8dzk2mhcqts.cloudfront.net/0772_PEW_Roundup/09_Squirrel.jpg",
    "http://www.cybersalt.org/images/funnypictures/s/supersquirrel.jpg",
    "http://www.zmescience.com/wp-content/uploads/2010/09/squirrel.jpg",
    "http://1.bp.blogspot.com/_v0neUj-VDa4/TFBEbqFQcII/AAAAAAAAFBU/E8kPNmF1h1E/s640/squirrelbacca-thumb.jpg"
  ]
  defp do_reply({:ship_it, message}) do
    {:message_create, Enum.random(@squirrels), message.channel_id}
  end

  @table_flips [
    "https://media.giphy.com/media/X83Y7r03T6uty/giphy.gif",
    "https://media.giphy.com/media/BmnbtcKKBGqfS/giphy.gif",
    "https://media.giphy.com/media/MXWpHJhkIDFU4/giphy.gif",
    "https://media.giphy.com/media/htKsHr2W6Y6Qg/giphy.gif",
    "https://media.giphy.com/media/IboGSjkXaOre0/giphy.gif",
    "http://i.imgur.com/ForPOJQ.gif"
  ]
  defp do_reply({:table_flip, message}) do
    {:message_create, Enum.random(@table_flips), message.channel_id}
  end

  @validations [
    "https://s3.amazonaws.com/assets.choremonster.com/hubot/chowyunfat.gif",
    "https://s3.amazonaws.com/assets.choremonster.com/hubot/phil.gif",
    "http://i.imgur.com/0b7zA.gif",
    "https://media.giphy.com/media/vp5ZHZ6OI31LO/giphy.gif",
    "http://i.imgur.com/jdIgXtN.gif"
  ]
  defp do_reply({:validate_me, message}) do
    {:message_create, Enum.random(@validations), message.channel_id}
  end

  @gir [
    "https://media.giphy.com/media/WD4WsLb59c1Ww/giphy.gif",
    "https://media.giphy.com/media/yRLcwNADQ2NuE/giphy.gif",
    "https://media.giphy.com/media/AyAHZ3Q0MgpeU/giphy.gif",
    "https://media.giphy.com/media/YsHoFItl0vSTK/giphy.gif",
    "https://media.giphy.com/media/vHuc4kluLHhHW/giphy.gif",
    "https://media.giphy.com/media/51sohge5oKVWw/giphy.gif",
    "https://media.giphy.com/media/ppRqWchpUIUN2/giphy.gif"
  ]
  defp do_reply({:gir_me, message}) do
    {:message_create, Enum.random(@gir), message.channel_id}
  end

  defp map_message(message = %Message{content: content}) do
    {_, type} =
      Enum.find(@message_types, {nil, :unknown}, fn {reg, _type} ->
        String.match?(content, reg)
      end)

    {type, message}
  end
end
