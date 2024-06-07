import { NativeModules } from 'react-native';

const { SKAdNetworkModule } = NativeModules;

const updateConversionValue = async (
  fineValue: number,
  coarseValue: number,
  lockWindow: boolean
): Promise<void> => {
  try {
    const result = await SKAdNetworkModule.setConversionValue(
      fineValue,
      coarseValue,
      lockWindow
    );
    console.info('Success:', result);
  } catch (error) {
    console.error('Error:', error);
  }
};

export const logEventSKAdNetwork = async (
  event: any,
  coarseValue: number = 0,
  lockWindow: boolean = false
): Promise<void> => {
  const bitValues: number[] = new Array(6).fill(0);
  const calculateConversionValue = (bits: number[]): number =>
    bits.reduce((acc, bit, index) => acc + bit * 2 ** index, 0);

  bitValues[event] = 1;

  const conversionValue = calculateConversionValue(bitValues);
  await updateConversionValue(conversionValue, coarseValue, lockWindow);
};
