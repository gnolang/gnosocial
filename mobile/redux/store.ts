import type { Action, ThunkAction } from "@reduxjs/toolkit";
import { configureStore } from "@reduxjs/toolkit";
import { accountSlice } from "./features/accountSlice";
import type { TypedUseSelectorHook } from "react-redux";
import { useSelector, useDispatch } from "react-redux";

export const store = configureStore({
  reducer: {
    [accountSlice.reducerPath]: accountSlice.reducer,
  },
});

export type RootState = ReturnType<typeof store.getState>;

export const useAppSelector: TypedUseSelectorHook<RootState> = useSelector;

export const useAppDispatch: () => AppDispatch = useDispatch;

export type AppDispatch = typeof store.dispatch;
export type AppThunk<ReturnType = void> = ThunkAction<ReturnType, RootState, unknown, Action>;
