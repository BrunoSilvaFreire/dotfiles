const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0F161E", /* black   */
  [1] = "#32504E", /* red     */
  [2] = "#595A58", /* green   */
  [3] = "#BC4F4F", /* yellow  */
  [4] = "#28AC56", /* blue    */
  [5] = "#B8A73A", /* magenta */
  [6] = "#953D9E", /* cyan    */
  [7] = "#86e3c2", /* white   */

  /* 8 bright colors */
  [8]  = "#5d9e87",  /* black   */
  [9]  = "#32504E",  /* red     */
  [10] = "#595A58", /* green   */
  [11] = "#BC4F4F", /* yellow  */
  [12] = "#28AC56", /* blue    */
  [13] = "#B8A73A", /* magenta */
  [14] = "#953D9E", /* cyan    */
  [15] = "#86e3c2", /* white   */

  /* special colors */
  [256] = "#0F161E", /* background */
  [257] = "#86e3c2", /* foreground */
  [258] = "#86e3c2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
