static const char norm_fg[] = "#86e3c2";
static const char norm_bg[] = "#0F161E";
static const char norm_border[] = "#5d9e87";

static const char sel_fg[] = "#86e3c2";
static const char sel_bg[] = "#595A58";
static const char sel_border[] = "#86e3c2";

static const char urg_fg[] = "#86e3c2";
static const char urg_bg[] = "#32504E";
static const char urg_border[] = "#32504E";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
