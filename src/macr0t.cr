module Macr0t
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

  USAGE = <<-U
  $ macr0t [OPTION | COUNT]

    OPTION:
    -h, --help        show this help
    -c, --continuous  continuously run until ^C

    COUNT             how many names to generate
                      (defaults to 1)
  U

  PREFIXES = %w(
    a
    Afro
    after
    ambi
    amphi
    an
    ana
    Anglo
    ante
    anti
    apo
    arch
    astro
    auto
    back
    be
    bi
    bio
    by
    circum
    cis
    co
    con
    contra
    counter
    cryo
    crypto
    de
    demi
    demo
    deuter
    di
    dia
    dis
    down
    du
    eco
    electro
    en
    epi
    Euro
    ex
    extra
    fore
    Franco
    gain
    geo
    gyro
    hemi
    hetero
    hind
    homo
    hydro
    hyper
    hypo
    ideo
    idio
    in
    Indo
    infra
    inter
    intra
    iso
    macr
    mal
    maxi
    mega
    meta
    micro
    mid
    midi
    mini
    mis
    mono
    multi
    neo
    non
    ob
    off
    omni
    on
    ortho
    out
    over
    paleo
    pan
    para
    ped
    per
    peri
    photo
    pleo
    pod
    poly
    post
    pre
    preter
    pro
    pros
    proto
    pseudo
    pyro
    quasi
    re
    retro
    self
    semi
    socio
    step
    sub
    super
    supra
    sur
    syn
    tele
    trans
    tri
    twi
    ultra
    umbe
    un
    under
    uni
    up
    vice
    with
    y
  )
  NUMBERS = (0..9).to_a.map(&.to_s)
  LETTERS = ('a'..'z').to_a.map(&.to_s)

  def self.generate
    String.build do |s|
      [
        Macr0t::PREFIXES,
        Macr0t::NUMBERS,
        Macr0t::LETTERS,
      ].each do |list|
        s << list.shuffle.first
      end
    end
  end
end

case ARGV[0]?
when "-h", "--help"       then puts Macr0t::USAGE
when "-c", "--continuous" then loop { puts Macr0t.generate }
else
  (ARGV[0]?.try(&.to_i) || 1).times do
    puts Macr0t.generate
  end
end
