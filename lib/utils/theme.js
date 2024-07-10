import { Dimensions } from "react-native";
const { height, width } = Dimensions.get("window");

const COLORS = {
  appColor: "#c62828",
  secondary: "#FFEB3B",

  gray: "#83829A",
  gray2: "#C1C0C8",

  offwhite: "#F3F4F8",
  white: "#FFFFFF",
  black: "#000000",

  error: "#e81e4d",
  success: " #00C135",
  warning: "#FAFAFC",
};

const SIZES = {
  xSmall: 10,
  small: 12,
  medium: 14,
  large: 18,
  xLarge: 24,
  xxLarge: 44,
  height,
  width,
};

const SHADOWS = {
  small: {
    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    elevation: 2,
  },
  medium: {
    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 5.84,
    elevation: 5,
  },
};

export { COLORS, SIZES, SHADOWS };
