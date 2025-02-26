import { useAccount } from "wagmi";
import { SuccessStepPresentational } from "./Presentational";
import webProofProofVerifier from "../../../../../out/WebProofVerifier.sol/WebProofVerifier.json";
import { useReadContract } from "wagmi";




export const SuccessStep = () => {
  const verifierAddress = import.meta.env.VITE_VERIFIER_ADDRESS;
  const { address } = useAccount();

  const { data: isAdult } = useReadContract({
    address: verifierAddress,
    abi: webProofProofVerifier.abi,
    functionName: "adults",
    args: [address],
  });

  return (
    <SuccessStepPresentational
      isAdult={isAdult as boolean}
      address={address as `0x${string}`}
    />
  );
};
