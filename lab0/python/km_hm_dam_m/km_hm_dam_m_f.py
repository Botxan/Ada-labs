def m_a_km_hm_dam_m_f(m_in):
    km = m_in // 1000
    hm = (m_in // 100) % 10
    dam = (m_in // 10) % 10
    m = m_in % 10
    return km, hm, dam, m